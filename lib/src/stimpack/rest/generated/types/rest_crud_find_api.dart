part of g3.stimpack.rest.generated;



class StimRestCrudFindApi extends StimModelSymbol<StimRestCrudFindApi> {
  StimRbacPolicy policy;

  Set<StimModelField> response;

  StimRestCrudFindApi();


  StimRestCrudFindApi ref() {
    return StimRestCrudFindApiRef()..symbol = this;
  }

  /// Creates a new "crudFindApi" of [StimRestCrudFindApi] type.
  StimRestCrudFindApi refWith({dynamic name, StimRbacPolicy policy, Set<StimModelField> response, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (policy != null) {
      res.policy = policy;
    }
    if (response != null) {
      res.response = response;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}


class StimRestCrudFindApiRef extends StimSymbolRef<StimRestCrudFindApi> implements StimRestCrudFindApi {

}


class StimRestCrudFindApiScope {
  /// Creates a new "crudFindApi" of [StimRestCrudFindApi] type.
  StimRestCrudFindApi of({dynamic name, StimRbacPolicy policy, Set<StimModelField> response, Set<StimModelTag> tags}) {
    return StimRestCrudFindApi()
        ..name = StimName.of(name)
        ..policy = policy
        ..response = response ?? {}
        ..tags = tags ?? {};
  }
}
