import 'package:g3m/gen.dart';
import 'package:g3m/stimpack.dart';
import 'package:g3m/stimpack_ex.dart';
import 'package:quiver/iterables.dart';

import 'doc/readme.dart';
import 'names.dart';

// =============================================================================

class GameProgram implements Program {
  final GameWorld world = GameWorld();

  @override
  void load() {
    _buildFields();
    _buildModels();
    _buildRelation();
    _buildTableFields();
    _buildActors();
    _buildActions();
    _buildStories();
  }

  @override
  void build(ProjectFolder folder) {
    _buildCommonFiles(folder);
    var docFolder = folder.newFolder('doc');
    _buildTableMarkDownDoc(docFolder);
    _buildStoryMarkdownDoc(docFolder);
  }

  @override
  void write(ProjectFolder folder) {}

  @override
  void deploy(ProjectFolder folder) {}

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  void _buildFields() {
    var f = world.field;

    f.invitedUserId = f.userId ^ 'invited user id';
    f.fromUserId = f.userId ^ 'from user id';
    f.suggestedUserId = f.userId ^ 'suggested user id';
  }

  // ---------------------------------------------------------------------------
  // Models
  // ---------------------------------------------------------------------------

  void _buildModels() {
    var m = world.model,
        f = world.field,
        r = world.erRelation,
        t = world.erRelationType;

    // These are the models owns by user.
    var m1 = m.none;
    m1 += m.project = m('project');
    m1 += m.game = m('game');
    m1 += m.gameEnvironment = m('game environment');
    m1 += m.gameRelease = m('game release');

    // All these model should be named.
    m1.fields += f.name + f.desc;

    // All these should be save in database.
    world.dbTable(m1);

    var m2 = m.none;

    m2 += m.friend = m('friend', fields: f.name + f.avatarUrl);
    m2 += m.friendInvitation = m('friend invitation');
    m2 += m.friendSuggestion = m('friend suggestion');

    // Builds list fields from the model
    f.friendList = f('friend list', m.friend.asDataType().asList());
    f.friendInvitationList =
        f('friend invitation list', m.friendInvitation.asDataType().asList());
    f.friendSuggestionList =
        f('friend suggestion list', m.friendSuggestion.asDataType().asList());

    m2 += m.party = m('party');
    m2 += m.partyInvitation = m('party invitation');
    m2 += m.partySuggestion = m('party suggestion');

    m2 += m.lobby = m('lobby');
    m2 += m.lobbyInvitation = m('lobby invitation');
    m2 += m.lobbySuggestion = m('lobby suggestion');

    r(m.user, t.own, m2);

    world.dbTable(m2);
  }

  Field _toFindRequestFieldList(Model item) {
    var f = world.field;
    var items = f('items').clone()..type = item.asDataType().asList();
    return f.total + f.pageIndex + f.pageSize + items;
  }

  // ---------------------------------------------------------------------------
  // Table Fields
  // ---------------------------------------------------------------------------

  void _buildTableFields() {
    var f = world.field, dt = world.dbTable;
    for (var i in dt.all.eval()) {
      i.fields + f.id + f.createdAt + f.modifiedAt + f.version;
      for (var j in i.models.eval()) {
        i.fields += j.fields;
      }
    }
  }

  // ---------------------------------------------------------------------------
  // Actors
  // ---------------------------------------------------------------------------

  void _buildActors() {
    var a = world.storyActor;
    a.projectAdmin = a('project admin');
    a.projectDeveloper = a('project developer');

    a.player = a('player');

    a.nonMember = a('non member');

    a.partyAdmin = a('party admin');
    a.partyMember = a('party member');

    a.lobbyAdmin = a('lobby admin');
    a.lobbyMember = a('lobby member');
  }

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  void _buildActions() {}

  // ---------------------------------------------------------------------------
  // Stories
  // ---------------------------------------------------------------------------

  void _buildStories() {
    var f = world.field,
        m = world.model,
        a = world.storyActor,
        t = world.storyAction,
        s = world.story;
    world.story(a.projectAdmin,
        t.manage >> (m.game + m.gameRelease + m.gameEnvironment))
      ..request = f.id + f.name
      ..response = f.id;

    s(a.projectAdmin, t.find >> m.game)
      ..request = f.pageSize + f.pageIndex
      ..response = _toFindRequestFieldList(m.game);

    // -------------------------------------------------------------------------
    // Builds out collaboration flows.
    // -------------------------------------------------------------------------
    var admin = [a.player, a.partyAdmin, a.lobbyAdmin];
    var member = [a.player, a.partyMember, a.lobbyMember];
    var invitation = [m.friendInvitation, m.partyInvitation, m.lobbyInvitation];
    var suggestion = [m.friendSuggestion, m.partySuggestion, m.lobbySuggestion];

    var n = admin.length;
    assert(member.length == n);
    assert(invitation.length == n);
    assert(suggestion.length == n);

    var s1 = s.none;
    // Admin send/cancel invitation
    for (var p in zip([admin, invitation])) {
      s1 += s(p[0], (t.send + t.cancel) >> p[1])
        ..request = f.invitedUserId.required()
        ..response = f.id;
    }

    // Non member see, accept, deny invitation
    for (var model in invitation) {
      s1 += s(a.nonMember, (t.accept + t.deny + t.see) >> model)
        ..request = f.invitedUserId.required()
        ..response = f.id;
    }

    // member see invitation
    for (var p in zip([member, invitation])) {
      s1 += s(p[0], (t.see) >> 'other' >> p[1])
        ..request = f.invitedUserId.required()
        ..response = f.id;
    }

    // member make/cancel suggestion
    for (var p in zip([member, invitation])) {
      s1 += s(p[0], (t.see) >> p[1])
        ..request = f.suggestedUserId.required() + f.fromUserId.required()
        ..response = f.id;
    }

    // admin see/accept/deny suggestion
    for (var p in zip([admin, suggestion])) {
      s1 += s(p[0], (t.see + t.accept + t.deny) >> 'other' >> p[1])
        ..request = f.suggestedUserId.required()
        ..response = f.id;
    }

    s1.eval().where((e) => e.action == t.see).forEach((e) {
      // TODO: Make it a list
    });
  }

  // -------------------------------------------------------------------------
  // Builds database relation.
  // -------------------------------------------------------------------------
  void _buildRelation() {
    var m = world.model, t = world.erRelationType, r = world.erRelation;

    r(m.project, t.hasMany, m.game + m.gameEnvironment + m.gameRelease);
    r(m.user, t.own, m.project + m.game + m.gameRelease + m.gameEnvironment);
  }

  // -------------------------------------------------------------------------
  // Builds
  // -------------------------------------------------------------------------
  void _buildCommonFiles(ProjectFolder folder) {
    folder.newFile('README.md', ReadmeDoc());
  }

  void _buildStoryMarkdownDoc(ProjectFolder out) {
    var s = world.story, a = world.storyActor;
    var doc = MarkdownDoc()..title = 'Features';
    out.newFile('stories.md', doc);

    for (var i in a.all.eval()) {
      var relatedStories = s.all.filterByActor(i);
      if (relatedStories.isNonEmptySet) {
        var p = doc.bottom.after(i.name.sentence().toString());
        for (final s in relatedStories.eval()) {
          _writeStoryToMarkdownDoc(p, s);
        }
      }
    }
  }

  void _writeStoryToMarkdownDoc(MarkdownParagraph paragraph, Story s) {
    paragraph.after(s.name.sentence().toString())
      ..write((w) {
        w + mk.bold % 'Authenticated:';
        if (s.actor.authorized) {
          w + 'No';
        } else {
          w + 'Yes';
          ~w + mk.bold % 'Role:';
          w + mk.italic % s.actor.name;
        }

        ~w + mk.bold % 'Request';

        for (var j in s.request.eval()) {
          w ^ '* ';
          w + mk.italic % j.name;
          w + ': ';
          w + j.type;

          if (j.constraints?.required == true) {
            w + ', required';
          }
        }

        ~w + mk.bold % 'Response';

        for (var j in s.response.eval()) {
          w ^ '* ';
          w + mk.italic % j.name;
          w + ': ';
          w + j.type;
        }
      });
  }

  void _buildTableMarkDownDoc(ProjectFolder out) {
    var dt = world.dbTable, doc = MarkdownDoc()..title = 'Tables';
    out.newFile('db.md', doc);

    for (var i in dt.all.eval()) {
      doc.bottom.after((i.name >> 'table').toString())
        ..write((w) {
          w + mk.bold % 'Name';
          w + ': ';
          w + snake % (i.name << 'tbl');

          ~w + mk.bold % 'Fields';

          for (var j in i.fields.eval()) {
            w ^ '* ';
            w + mk.italic % j.name.snake();
            w + ': ';
            w + j.type;
          }
        });
    }
  }
}
