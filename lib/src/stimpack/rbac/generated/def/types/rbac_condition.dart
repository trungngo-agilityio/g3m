part of g3.stimpack.rbac.generated;



class StimRbacCondition extends StimModelSymbol<StimRbacCondition> {
  StimRbacRole ifHasRole;

  Set<StimRbacRole> ifHasAnyRoles;

  Set<StimRbacRole> ifHasAllRoles;

  Set<StimRbacCondition> ifAnyOf;

  Set<StimRbacCondition> ifAllOf;

  StimRbacCondition();


  /// Creates a new "condition" of [StimRbacCondition] type.
  StimRbacCondition copyWith({@required
  dynamic name, StimRbacRole ifHasRole, Set<StimRbacRole> ifHasAnyRoles, Set<StimRbacRole> ifHasAllRoles, Set<StimRbacCondition> ifAnyOf, Set<StimRbacCondition> ifAllOf, Set<StimModelTag> tags}) {
    return StimRbacCondition()
        ..name = StimName.of(name ?? this.name)
        ..ifHasRole = ifHasRole ?? this.ifHasRole
        ..ifHasAnyRoles = ifHasAnyRoles ?? this.ifHasAnyRoles
        ..ifHasAllRoles = ifHasAllRoles ?? this.ifHasAllRoles
        ..ifAnyOf = ifAnyOf ?? this.ifAnyOf
        ..ifAllOf = ifAllOf ?? this.ifAllOf
        ..tags = tags ?? this.tags;
  }
}


class StimRbacConditionScope {
  StimRbacCondition isUser;

  StimRbacCondition isGuest;

  StimRbacCondition isOwner;

  StimRbacCondition isShared;

  StimRbacCondition isInRole;

  StimRbacCondition isInSuperAdminRole;

  StimRbacCondition isInAdminRole;

  StimRbacCondition isInUserRole;


  /// Creates a new "condition" of [StimRbacCondition] type.
  StimRbacCondition of({@required
  dynamic name, StimRbacRole ifHasRole, Set<StimRbacRole> ifHasAnyRoles, Set<StimRbacRole> ifHasAllRoles, Set<StimRbacCondition> ifAnyOf, Set<StimRbacCondition> ifAllOf, Set<StimModelTag> tags}) {
    return StimRbacCondition()
        ..name = StimName.of(name)
        ..ifHasRole = ifHasRole
        ..ifHasAnyRoles = ifHasAnyRoles ?? {}
        ..ifHasAllRoles = ifHasAllRoles ?? {}
        ..ifAnyOf = ifAnyOf ?? {}
        ..ifAllOf = ifAllOf ?? {}
        ..tags = tags ?? {};
  }
}
