part of g3.stimpack.ngxs.generated;



class StimNgxsAction extends StimModelSymbol<StimNgxsAction> {
  Set<StimModelField> fields;

  StimNgxsAction();


  StimNgxsAction ref() {
    return StimNgxsActionRef()..symbol = this;
  }

  /// Creates a new "action" of [StimNgxsAction] type.
  StimNgxsAction refWith({dynamic name, Set<StimModelField> fields, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (fields != null) {
      res.fields = fields;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}


class StimNgxsActionRef extends StimSymbolRef<StimNgxsAction> implements StimNgxsAction {

}


class StimNgxsActionScope {
  /// Creates a new "action" of [StimNgxsAction] type.
  StimNgxsAction of({dynamic name, Set<StimModelField> fields, Set<StimModelTag> tags}) {
    return StimNgxsAction()
        ..name = StimName.of(name)
        ..fields = fields ?? {}
        ..tags = tags ?? {};
  }
}
