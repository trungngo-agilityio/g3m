part of g3.stimpack.func.generated;



class StimFuncFilter extends StimModelSymbol<StimFuncFilter> {
  StimModelType from;

  StimModelFuncCode code;

  StimFuncFilter();


  StimFuncFilter ref() {
    return StimFuncFilterRef()..symbol = this;
  }

  /// Creates a new "filter" of [StimFuncFilter] type.
  StimFuncFilter refWith({dynamic name, StimModelType from, StimModelFuncCode code, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (from != null) {
      res.from = from;
    }

    if (code != null) {
      res.code = code;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimFuncFilterRef extends StimSymbolRef<StimFuncFilter> implements StimFuncFilter {

}


class StimFuncFilterScope {
  /// Creates a new "filter" of [StimFuncFilter] type.
  StimFuncFilter of({dynamic name, StimModelType from, StimModelFuncCode code, Set<StimModelTag> tags}) {
    return StimFuncFilter()
        ..name = StimName.of(name)
        ..from = from
        ..code = code
        ..tags = tags ?? {};
  }
}
