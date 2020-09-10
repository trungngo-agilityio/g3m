part of g3.stimpack.rbac.generated;



class StimRbacGroup extends StimModelSymbol<StimRbacGroup> {
  Set<StimRbacGroup> groups;

  Set<StimRbacRole> roles;

  StimRbacGroup();


  StimRbacGroup ref() {
    return StimRbacGroupRef()..symbol = this;
  }

  /// Creates a new "group" of [StimRbacGroup] type.
  StimRbacGroup refWith({dynamic name, Set<StimRbacGroup> groups, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (groups != null) {
      res.groups = groups;
    }

    if (roles != null) {
      res.roles = roles;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimRbacGroupRef extends StimSymbolRef<StimRbacGroup> implements StimRbacGroup {

}


class StimRbacGroupScope {
  /// Creates a new "group" of [StimRbacGroup] type.
  StimRbacGroup of({@required
  dynamic name, Set<StimRbacGroup> groups, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    return StimRbacGroup()
        ..name = StimName.of(name)
        ..groups = groups ?? {}
        ..roles = roles ?? {}
        ..tags = tags ?? {};
  }
}
