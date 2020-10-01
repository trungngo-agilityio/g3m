part of g3.stimpack.faker.generated;



class StimFakerField extends StimModelSymbol<StimFakerField> {
  /// The model field that the [faker] is applied.
  StimModelField field;

  /// The faker applied to the [field].
  StimFakerType type;

  StimFakerField();


  /// Creates a new "field" of [StimFakerField] type.
  StimFakerField copyWith({@required
  dynamic name, @required
  StimModelField field, @required
  StimFakerType type, Set<StimModelTag> tags}) {
    return StimFakerField()
        ..name = StimName.of(name ?? this.name)
        ..field = field ?? this.field
        ..type = type ?? this.type
        ..tags = tags ?? this.tags;
  }
}


class StimFakerFieldScope {
  /// Creates a new "field" of [StimFakerField] type.
  StimFakerField of({@required
  dynamic name, @required
  StimModelField field, @required
  StimFakerType type, Set<StimModelTag> tags}) {
    return StimFakerField()
        ..name = StimName.of(name)
        ..field = field
        ..type = type
        ..tags = tags ?? {};
  }
}
