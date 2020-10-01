part of g3.stimpack.faker.generated;



/// A faker that builds a [type].
class StimFakerType extends StimModelSymbol<StimFakerType> {
  /// The package that this type faker is belong to
  StimFakerPackage package;

  /// The set of [params] that need to be sent to the faker
  Set<StimModelField> params;

  /// The data [type] that this faker works with.
  StimModelType type;

  /// The set of fields, from the model type this faker can generate. 
  /// This should not be set for primitive data types like string, int, etc.
  Set<StimFakerField> fields;

  StimFakerType();


  /// Creates a new "type" of [StimFakerType] type.
  StimFakerType copyWith({@required
  dynamic name, StimFakerPackage package, Set<StimModelField> params, @required
  StimModelType type, Set<StimFakerField> fields, Set<StimModelTag> tags}) {
    return StimFakerType()
        ..name = StimName.of(name ?? this.name)
        ..package = package ?? this.package
        ..params = params ?? this.params
        ..type = type ?? this.type
        ..fields = fields ?? this.fields
        ..tags = tags ?? this.tags;
  }
}


class StimFakerTypeScope {
  StimFakerType loremWord;

  StimFakerType loremWords;

  StimFakerType loremSentence;

  StimFakerType loremSentences;

  StimFakerType loremParagraph;

  StimFakerType loremParagraphs;

  StimFakerType randomString;

  StimFakerType randomNum;

  StimFakerType randomInt;

  StimFakerType randomDouble;

  StimFakerType randomBool;

  StimFakerType randomDateTime;

  StimFakerType randomDuration;

  StimFakerType randomUri;


  /// Creates a new "type" of [StimFakerType] type.
  StimFakerType of({@required
  dynamic name, StimFakerPackage package, Set<StimModelField> params, @required
  StimModelType type, Set<StimFakerField> fields, Set<StimModelTag> tags}) {
    return StimFakerType()
        ..name = StimName.of(name)
        ..package = package
        ..params = params ?? {}
        ..type = type
        ..fields = fields ?? {}
        ..tags = tags ?? {};
  }
}
