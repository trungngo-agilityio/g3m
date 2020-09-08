part of g3.stimpack.func.generated;



class StimFuncMap extends StimModelSymbol<StimFuncMap> {
  StimModelType from;

  StimModelType to;

  Set<StimModelField> removedFields;

  Set<StimFuncFieldMap> mappedFields;

  StimModelFuncCode code;

  StimFuncMap();


  StimFuncMap ref() {
    return StimFuncMapRef()..symbol = this;
  }

  /// Creates a new "map" of [StimFuncMap] type.
  StimFuncMap refWith({dynamic name, StimModelType from, StimModelType to, Set<StimModelField> removedFields, Set<StimFuncFieldMap> mappedFields, StimModelFuncCode code, Set<StimModelTag> tags}) {
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

    if (removedFields != null) {
      res.removedFields = removedFields;
    }

    if (mappedFields != null) {
      res.mappedFields = mappedFields;
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


class StimFuncMapRef extends StimSymbolRef<StimFuncMap> implements StimFuncMap {

}


class StimFuncMapScope {
  /// Creates a new "map" of [StimFuncMap] type.
  StimFuncMap of({dynamic name, StimModelType from, StimModelType to, Set<StimModelField> removedFields, Set<StimFuncFieldMap> mappedFields, StimModelFuncCode code, Set<StimModelTag> tags}) {
    return StimFuncMap()
        ..name = StimName.of(name)
        ..from = from
        ..to = to
        ..removedFields = removedFields ?? {}
        ..mappedFields = mappedFields ?? {}
        ..code = code
        ..tags = tags ?? {};
  }
}
