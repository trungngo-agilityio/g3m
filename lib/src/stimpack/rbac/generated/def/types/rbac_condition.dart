part of g3.stimpack.rbac.generated;



class StimRbacCondition extends StimModelSymbol<StimRbacCondition> {
  StimRbacRole ifHasRole;

  Set<StimRbacRole> ifHasAnyRoles;

  Set<StimRbacRole> ifHasAllRoles;

  Set<StimRbacCondition> ifAnyOf;

  Set<StimRbacCondition> ifAllOf;

  StimRbacCondition();


  StimRbacCondition ref() {
    return StimRbacConditionRef()..symbol = this;
  }

  /// Creates a new "condition" of [StimRbacCondition] type.
  StimRbacCondition refWith({dynamic name, StimRbacRole ifHasRole, Set<StimRbacRole> ifHasAnyRoles, Set<StimRbacRole> ifHasAllRoles, Set<StimRbacCondition> ifAnyOf, Set<StimRbacCondition> ifAllOf, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (ifHasRole != null) {
      res.ifHasRole = ifHasRole;
    }

    if (ifHasAnyRoles != null) {
      res.ifHasAnyRoles = ifHasAnyRoles;
    }

    if (ifHasAllRoles != null) {
      res.ifHasAllRoles = ifHasAllRoles;
    }

    if (ifAnyOf != null) {
      res.ifAnyOf = ifAnyOf;
    }

    if (ifAllOf != null) {
      res.ifAllOf = ifAllOf;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimRbacConditionRef extends StimSymbolRef<StimRbacCondition> implements StimRbacCondition {

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
  StimRbacCondition of({dynamic name, StimRbacRole ifHasRole, Set<StimRbacRole> ifHasAnyRoles, Set<StimRbacRole> ifHasAllRoles, Set<StimRbacCondition> ifAnyOf, Set<StimRbacCondition> ifAllOf, Set<StimModelTag> tags}) {
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
