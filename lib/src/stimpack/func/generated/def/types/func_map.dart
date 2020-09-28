part of g3.stimpack.func.generated;



class StimFuncMap extends StimModelSymbol<StimFuncMap> {
  StimModelType from;

  StimModelType to;

  Set<StimModelField> removedFields;

  Set<StimFuncFieldMap> mappedFields;

  StimModelFuncCode code;

  StimFuncMap();


  /// Creates a new "map" of [StimFuncMap] type.
  StimFuncMap copyWith({@required
  dynamic name, StimModelType from, StimModelType to, Set<StimModelField> removedFields, Set<StimFuncFieldMap> mappedFields, StimModelFuncCode code, Set<StimModelTag> tags}) {
    return StimFuncMap()
        ..name = StimName.of(name ?? this.name)
        ..from = from ?? this.from
        ..to = to ?? this.to
        ..removedFields = removedFields ?? this.removedFields
        ..mappedFields = mappedFields ?? this.mappedFields
        ..code = code ?? this.code
        ..tags = tags ?? this.tags;
  }
}


class StimFuncMapScope {
  /// Creates a new "map" of [StimFuncMap] type.
  StimFuncMap of({@required
  dynamic name, StimModelType from, StimModelType to, Set<StimModelField> removedFields, Set<StimFuncFieldMap> mappedFields, StimModelFuncCode code, Set<StimModelTag> tags}) {
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
