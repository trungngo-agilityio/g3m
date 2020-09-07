part of g3.stimpack.rbac.generated;



class StimRbacResourceId extends StimModelSymbol<StimRbacResourceId> {
  StimRbacResourceId();


  StimRbacResourceId ref() {
    return StimRbacResourceIdRef()..symbol = this;
  }

  /// Creates a new "resourceId" of [StimRbacResourceId] type.
  StimRbacResourceId refWith({dynamic name, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimRbacResourceIdRef extends StimSymbolRef<StimRbacResourceId> implements StimRbacResourceId {

}


class StimRbacResourceIdScope {
  /// Creates a new "resourceId" of [StimRbacResourceId] type.
  StimRbacResourceId of({dynamic name, Set<StimModelTag> tags}) {
    return StimRbacResourceId()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
