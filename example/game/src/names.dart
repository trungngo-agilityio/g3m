import 'package:g3m/stimpack.dart';
import 'package:g3m/stimpack_ex.dart';

class GameWorld extends WorldEx {
  GameFieldScope _field;

  @override
  GameFieldScope get field => _field ??= GameFieldScope(type, constraint);

  GameModelScope _model;

  @override
  GameModelScope get model => _model ??= GameModelScope(field);

  GameDataTypeScope _type;

  @override
  GameDataTypeScope get type => _type ??= GameDataTypeScope(constraint);

  GameActionScope _action;

  @override
  GameActionScope get storyAction => _action ??= GameActionScope();

  GameActorScope _actor;

  @override
  GameActorScope get storyActor => _actor ??= GameActorScope();
}

class GameFieldScope extends FieldScopeEx {
  GameFieldScope(DataTypeScopeEx type, ConstraintScopeEx constraint)
      : super(type, constraint);

  Field invitedUserId, fromUserId, suggestedUserId;
  Field friendList, friendInvitationList, friendSuggestionList;
}

class GameModelScope extends ModelScopeEx {
  Model project, game, gameEnvironment, gameRelease, projectTeam, projectMember;
  Model friend, friendInvitation, friendSuggestion;
  Model party, partyInvitation, partySuggestion;
  Model lobby, lobbyInvitation, lobbySuggestion;

  GameModelScope(FieldScopeEx field) : super(field);
}

class GameDataTypeScope extends DataTypeScopeEx {
  GameDataTypeScope(ConstraintScopeEx constraintScopeEx)
      : super(constraintScopeEx);
}

class GameConstraintScope extends ConstraintScopeEx {
  GameConstraintScope(PatternScopeEx pattern) : super(pattern);
}

class GamePatternScope extends PatternScopeEx {}

class GameActorScope extends StoryActorScopeEx {
  Actor projectAdmin, projectDeveloper;
  Actor player;
  Actor nonMember;
  Actor partyAdmin, partyMember;
  Actor lobbyAdmin, lobbyMember;
}

class GameActionScope extends StoryActionScopeEx {}
