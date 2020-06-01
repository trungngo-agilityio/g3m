import 'package:g3m/g3m.dart';
import 'package:g3m/g3mex.dart';

class CoreFieldScope extends FieldScopeEx {
  CoreFieldScope(DataTypeScopeEx type, ConstraintScopeEx constraint)
      : super(type, constraint);

  Field invitedUserId, fromUserId, suggestedUserId;
  Field friendList, friendInvitationList, friendSuggestionList;
}

class CoreModelScope extends ModelScopeEx {
  Model project, game, gameEnvironment, gameRelease, projectTeam, projectMember;
  Model friend, friendInvitation, friendSuggestion;
  Model party, partyInvitation, partySuggestion;
  Model lobby, lobbyInvitation, lobbySuggestion;

  CoreModelScope(FieldScopeEx field) : super(field);
}

class CoreDataTypeScope extends DataTypeScopeEx {
  CoreDataTypeScope(ConstraintScopeEx constraintScopeEx)
      : super(constraintScopeEx);
}

class CoreConstraintScope extends ConstraintScopeEx {
  CoreConstraintScope(PatternScopeEx pattern) : super(pattern);
}

class CorePatternScope extends PatternScopeEx {}

class CoreActorScope extends ActorScopeEx {
  Actor projectAdmin, projectDeveloper;
  Actor player;
  Actor nonMember;
  Actor partyAdmin, partyMember;
  Actor lobbyAdmin, lobbyMember;
}

class CoreActionScope extends ActionScopeEx {}
