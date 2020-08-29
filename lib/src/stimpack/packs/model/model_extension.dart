part of g3.stimpack.model;

extension StimModelFieldExtension on StimModelField {
  StimModelField required() {
    return this..rules += stimpack.model.rule.s.required;
  }

  StimModelField unique() {
    return this..rules += stimpack.model.rule.s.unique;
  }
}
