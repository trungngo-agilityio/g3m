part of g3.stimpack.func.generated;



class StimFuncFieldMap extends StimModelSymbol<StimFuncFieldMap> {
  StimModelField from;

  StimModelField to;

  StimFuncMap map;

  StimFuncFieldMap();


  StimFuncFieldMap ref() {
    return StimFuncFieldMapRef()..symbol = this;
  }

  /// Creates a new "fieldMap" of [StimFuncFieldMap] type.
  StimFuncFieldMap refWith({dynamic name, StimModelField from, StimModelField to, StimFuncMap map, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (from != null) {
      res.from = from;
    }

    if (to != null) {
      res.to = to;
    }

    if (map != null) {
      res.map = map;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimFuncFieldMapRef extends StimSymbolRef<StimFuncFieldMap> implements StimFuncFieldMap {

}


class StimFuncFieldMapScope {
  /// Creates a new "fieldMap" of [StimFuncFieldMap] type.
  StimFuncFieldMap of({dynamic name, StimModelField from, StimModelField to, StimFuncMap map, Set<StimModelTag> tags}) {
    return StimFuncFieldMap()
        ..name = StimName.of(name)
        ..from = from
        ..to = to
        ..map = map
        ..tags = tags ?? {};
  }
}
