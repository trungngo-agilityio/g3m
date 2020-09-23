part of g3.stimpack.func.generated;



class StimFuncFilter extends StimModelSymbol<StimFuncFilter> {
  StimModelType from;

  StimModelFuncCode code;

  StimFuncFilter();


  /// Creates a new "filter" of [StimFuncFilter] type.
  StimFuncFilter copyWith({@required
  dynamic name, StimModelType from, StimModelFuncCode code, Set<StimModelTag> tags}) {
    return StimFuncFilter()
        ..name = StimName.of(name ?? this.name)
        ..from = from ?? this.from
        ..code = code ?? this.code
        ..tags = tags ?? this.tags;
  }
}


class StimFuncFilterScope {
  /// Creates a new "filter" of [StimFuncFilter] type.
  StimFuncFilter of({@required
  dynamic name, StimModelType from, StimModelFuncCode code, Set<StimModelTag> tags}) {
    return StimFuncFilter()
        ..name = StimName.of(name)
        ..from = from
        ..code = code
        ..tags = tags ?? {};
  }
}
