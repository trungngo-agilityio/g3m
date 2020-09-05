part of g3.stimpack.rest.generated;



class StimRestCrudDeleteApi extends StimModelSymbol<StimRestCrudDeleteApi> {
  StimRbacPolicy policy;

  Set<StimModelField> response;

  StimRestCrudDeleteApi();


  StimRestCrudDeleteApi ref() {
    return StimRestCrudDeleteApiRef()..symbol = this;
  }

  /// Creates a new "crudDeleteApi" of [StimRestCrudDeleteApi] type.
  StimRestCrudDeleteApi refWith({dynamic name, StimRbacPolicy policy, Set<StimModelField> response, Set<StimModelTag> tags}) {
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


class StimRestCrudDeleteApiRef extends StimSymbolRef<StimRestCrudDeleteApi> implements StimRestCrudDeleteApi {

}


class StimRestCrudDeleteApiScope {
  /// Creates a new "crudDeleteApi" of [StimRestCrudDeleteApi] type.
  StimRestCrudDeleteApi of({dynamic name, StimRbacPolicy policy, Set<StimModelField> response, Set<StimModelTag> tags}) {
    return StimRestCrudDeleteApi()
        ..name = StimName.of(name)
        ..policy = policy
        ..response = response ?? {}
        ..tags = tags ?? {};
  }
}
