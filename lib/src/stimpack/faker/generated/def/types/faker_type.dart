part of g3.stimpack.faker.generated;



/// A set of fakers available for a type [type].
class StimFakerType extends StimModelSymbol<StimFakerType> {
  /// The data [type] that this faker works with.
  StimModelType type;

  StimFakerType();


  /// Creates a new "type" of [StimFakerType] type.
  StimFakerType copyWith({@required
  dynamic name, @required
  StimModelType type, Set<StimModelTag> tags}) {
    return StimFakerType()
        ..name = StimName.of(name ?? this.name)
        ..type = type ?? this.type
        ..tags = tags ?? this.tags;
  }
}


class StimFakerTypeScope {
  StimFakerType none;


  /// Creates a new "type" of [StimFakerType] type.
  StimFakerType of({@required
  dynamic name, @required
  StimModelType type, Set<StimModelTag> tags}) {
    return StimFakerType()
        ..name = StimName.of(name)
        ..type = type
        ..tags = tags ?? {};
  }
}
