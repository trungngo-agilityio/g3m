part of g3.stimpack.rest.generated;



class StimRestCrudFindApi extends StimModelSymbol<StimRestCrudFindApi> {
  StimRestCrudFindApiRef _ref;

  StimRestCrudFindApiRef get ref {
    return _ref ??= StimRestCrudFindApiRef();
  }
  StimRestCrudFindApi();
}


class StimRestCrudFindApiRef extends StimSymbolRef<StimRestCrudFindApi> implements StimRestCrudFindApi {

}


class StimRestCrudFindApiScope {
  /// Creates a new "crudFindApi" of [StimRestCrudFindApi] type.
  StimRestCrudFindApi of({dynamic name, Set<StimModelTag> tags}) {
    return StimRestCrudFindApi()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
