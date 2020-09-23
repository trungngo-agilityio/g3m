part of g3.stimpack.func.generated;



class StimFuncFieldMap extends StimModelSymbol<StimFuncFieldMap> {
  StimModelField from;

  StimModelField to;

  StimFuncMap map;

  StimFuncFieldMap();


  /// Creates a new "fieldMap" of [StimFuncFieldMap] type.
  StimFuncFieldMap copyWith({@required
  dynamic name, StimModelField from, StimModelField to, StimFuncMap map, Set<StimModelTag> tags}) {
    return StimFuncFieldMap()
        ..name = StimName.of(name ?? this.name)
        ..from = from ?? this.from
        ..to = to ?? this.to
        ..map = map ?? this.map
        ..tags = tags ?? this.tags;
  }
}


class StimFuncFieldMapScope {
  /// Creates a new "fieldMap" of [StimFuncFieldMap] type.
  StimFuncFieldMap of({@required
  dynamic name, StimModelField from, StimModelField to, StimFuncMap map, Set<StimModelTag> tags}) {
    return StimFuncFieldMap()
        ..name = StimName.of(name)
        ..from = from
        ..to = to
        ..map = map
        ..tags = tags ?? {};
  }
}
