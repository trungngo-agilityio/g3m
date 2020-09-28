part of g3.stimpack.firebase.generated;



class StimFirebaseFunctionClient extends StimModelSymbol<StimFirebaseFunctionClient> {
  Set<StimFirebaseFunction> functions;

  StimFirebaseFunctionClient();


  /// Creates a new "functionClient" of [StimFirebaseFunctionClient] type.
  StimFirebaseFunctionClient copyWith({@required
  dynamic name, Set<StimFirebaseFunction> functions, Set<StimModelTag> tags}) {
    return StimFirebaseFunctionClient()
        ..name = StimName.of(name ?? this.name)
        ..functions = functions ?? this.functions
        ..tags = tags ?? this.tags;
  }
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
