part of g3.stimpack.rest.generated;



class StimRestCrudFindApi extends StimModelSymbol<StimRestCrudFindApi> {
  StimRestApi api;

  StimRestCrudFindApi();


  StimRestCrudFindApi ref() {
    return StimRestCrudFindApiRef()..symbol = this;
  }

  /// Creates a new "crudFindApi" of [StimRestCrudFindApi] type.
  StimRestCrudFindApi refWith({dynamic name, StimRestApi api, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (api != null) {
      res.api = api;
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
  StimRestCrudFindApi of({@required
  dynamic name, @required
  StimRestApi api, Set<StimModelTag> tags}) {
    return StimRestCrudFindApi()
        ..name = StimName.of(name)
        ..api = api
        ..tags = tags ?? {};
  }
}
