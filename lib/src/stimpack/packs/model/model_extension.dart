part of g3.stimpack.model;

extension StimModelFieldExtension on StimModelField {
  StimModelField get required {
    return clone()..rules += stimpack.model.rule.required;
  }

  StimModelField get unique {
    return clone()..rules += stimpack.model.rule.unique;
  }
}
