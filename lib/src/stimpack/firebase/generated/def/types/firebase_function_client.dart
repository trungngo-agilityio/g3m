part of g3.stimpack.firebase.generated;



class StimFirebaseFunctionClient extends StimModelSymbol<StimFirebaseFunctionClient> {
  Set<StimFirebaseFunction> functions;

  StimFirebaseFunctionClient();


  StimFirebaseFunctionClient ref() {
    return StimFirebaseFunctionClientRef()..symbol = this;
  }

  /// Creates a new "functionClient" of [StimFirebaseFunctionClient] type.
  StimFirebaseFunctionClient refWith({dynamic name, Set<StimFirebaseFunction> functions, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (functions != null) {
      res.functions = functions;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimFirebaseFunctionClientRef extends StimSymbolRef<StimFirebaseFunctionClient> implements StimFirebaseFunctionClient {

}


class StimFirebaseFunctionClientScope {
  /// Creates a new "functionClient" of [StimFirebaseFunctionClient] type.
  StimFirebaseFunctionClient of({@required
  dynamic name, Set<StimFirebaseFunction> functions, Set<StimModelTag> tags}) {
    return StimFirebaseFunctionClient()
        ..name = StimName.of(name)
        ..functions = functions ?? {}
        ..tags = tags ?? {};
  }
}
