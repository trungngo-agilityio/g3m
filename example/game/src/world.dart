import 'package:g3m/g3gen.dart';
import 'package:g3m/g3m.dart';
import 'package:g3m/g3mex.dart';
import 'package:quiver/iterables.dart';

import 'doc/readme.dart';
import 'names.dart';

// =============================================================================

class GameProgram extends WorldEx implements Program {
  final GameWorld world = GameWorld();

  CodeDoc rpcCodeDoc;
  CodeDoc protoMessageCodeDoc;

  GameProgram() {}

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
    _buildModelCode(folder);
    _buildProtoCode(folder);

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
    var f = field;
    var items = f('items').clone()..type = item.asDataType().asList();
    return f.total + f.pageIndex + f.pageSize + items;
  }

  // ---------------------------------------------------------------------------
  // Table Fields
  // ---------------------------------------------------------------------------

  void _buildTableFields() {
    var f = field, dt = world.dbTable;
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
    var f = world.field, m = world.model, a = world.storyActor, t = world.storyAction;
    story(a.projectAdmin,
        t.manage >> (m.game + m.gameRelease + m.gameEnvironment))
      ..request = field.id + field.name
      ..response = field.id;

    story(a.projectAdmin, t.find >> m.game)
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

    var s1 = story.none;
    // Admin send/cancel invitation
    for (var p in zip([admin, invitation])) {
      s1 += story(p[0], (t.send + t.cancel) >> p[1])
        ..request = f.invitedUserId.required()
        ..response = f.id;
    }

    // Non member see, accept, deny invitation
    for (var model in invitation) {
      s1 += story(a.nonMember, (t.accept + t.deny + t.see) >> model)
        ..request = f.invitedUserId.required()
        ..response = f.id;
    }

    // member see invitation
    for (var p in zip([member, invitation])) {
      s1 += story(p[0], (t.see) >> 'other' >> p[1])
        ..request = f.invitedUserId.required()
        ..response = f.id;
    }

    // member make/cancel suggestion
    for (var p in zip([member, invitation])) {
      s1 += story(p[0], (t.see) >> p[1])
        ..request = f.suggestedUserId.required() + f.fromUserId.required()
        ..response = f.id;
    }

    // admin see/accept/deny suggestion
    for (var p in zip([admin, suggestion])) {
      s1 += story(p[0], (t.see + t.accept + t.deny) >> 'other' >> p[1])
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
    var m = world.model, t = world.erRelationType;
    erRelation(m.project, t.hasMany, m.game + m.gameEnvironment + m.gameRelease);

    erRelation(
        m.user, t.own, m.project + m.game + m.gameRelease + m.gameEnvironment);
  }

  // -------------------------------------------------------------------------
  // Builds
  // -------------------------------------------------------------------------
  void _buildCommonFiles(ProjectFolder folder) {
    folder.newFile('README.md', ReadmeDoc());
  }

  void _buildModelCode(ProjectFolder folder) {
    var cfg = CodeConfig.forDart(), dt = world.dbTable;
    for (var i in dt.all.eval()) {
      final doc = CodeDoc(cfg);

      final name = i.name.snake().toString() + '.dart';
      folder.newFile(name.toString(), doc);

      doc.package = 'g3model';

      var clz = doc.clazz(i.name);
      for (var j in i.fields.eval()) {
        clz.field(j.name, j.type.name);
      }
    }
  }

  void _buildProtoCode(ProjectFolder folder) {
    var gRpcCfg = CodeConfig.forGRpc();

    var oldWritePackage = gRpcCfg.writePackage;
    gRpcCfg.writePackage = (w, doc) {
      w.statement('syntax = \'proto3\'');
      oldWritePackage(w, doc);
      w.writeln();
      w.statement('option csharp_namespace = "G3.Platform.PlayerSdk"');
    };

    // Makes a proto file for all grpc services
    rpcCodeDoc = CodeDoc(gRpcCfg)..package = 'g3playersdk';
    rpcCodeDoc.comment.write((w) {
      w + 'This is just a sample comment';
    });
    folder.newFile('grpc.proto', rpcCodeDoc);

    var proto3Cfg = CodeConfig.forProto3();
    protoMessageCodeDoc = CodeDoc(proto3Cfg)..package = 'g3playersdk';
    folder.newFile('message.proto', protoMessageCodeDoc);

    final rpcMap = <Actor, CodeClazz>{};

    for (var i in story.all.eval()) {
      var reqName = i.name & 'request';
      var resName = i.name & 'response';
      var rpcName = i.actor.name & 'rpc';
      var methodName = i.name - i.actor.name;

      var rpcMethodRef = proto3Cfg.className % rpcName +
          '.' +
          proto3Cfg.functionName % methodName;

      // -----------------------------------------------------------------------
      // Adding message request
      // -----------------------------------------------------------------------
      var req = protoMessageCodeDoc.clazz(reqName,
          comment: 'Request message for [$rpcMethodRef].');

      var idx = 10;
      for (var j in i.request.eval()) {
        req.field(j.name, j.type.name, index: idx++);
      }

      // -----------------------------------------------------------------------
      // Adding message response
      // -----------------------------------------------------------------------
      idx = 10;
      var res = protoMessageCodeDoc.clazz(resName,
          comment: 'Response message for [$rpcMethodRef]. method.');

      for (var j in i.response.eval()) {
        res.field(j.name, j.type.name, index: idx++);
      }

      // -----------------------------------------------------------------------
      // Adding rpc method
      // -----------------------------------------------------------------------
      var rpc = rpcMap[i.actor] ??= rpcMap[i.actor] = rpcCodeDoc.clazz(rpcName,
          abstract: true, comment: 'Rpc for ${i.actor.name} actor');
      rpc.func(methodName, abstract: true)
        ..inArg('req', req.name)
        ..outArg(res.name, name: 'res');
    }
  }

  void _buildStoryMarkdownDoc(ProjectFolder out) {
    var doc = MarkdownDoc()..title = 'Features';
    out.newFile('stories.md', doc);

    var stories = List.of(story.all.eval());
    var actors = List.of(storyActor.all.eval());

    for (var a in actors) {
      var relatedStories = stories.where((e) => e.actor == a);
      if (relatedStories.isNotEmpty) {
        var p = doc.bottom.after(a.name.sentence().toString());
        for (var s in relatedStories) {
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
