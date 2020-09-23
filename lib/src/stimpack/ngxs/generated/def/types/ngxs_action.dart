part of g3.stimpack.ngxs.generated;



class StimNgxsAction extends StimModelSymbol<StimNgxsAction> {
  Set<StimModelField> fields;

  StimNgxsAction();


  /// Creates a new "action" of [StimNgxsAction] type.
  StimNgxsAction copyWith({@required
  dynamic name, Set<StimModelField> fields, Set<StimModelTag> tags}) {
    return StimNgxsAction()
        ..name = StimName.of(name ?? this.name)
        ..fields = fields ?? this.fields
        ..tags = tags ?? this.tags;
  }
}


class StimNgxsActionScope {
  /// Creates a new "action" of [StimNgxsAction] type.
  StimNgxsAction of({@required
  dynamic name, Set<StimModelField> fields, Set<StimModelTag> tags}) {
    return StimNgxsAction()
        ..name = StimName.of(name)
        ..fields = fields ?? {}
        ..tags = tags ?? {};
  }
}
