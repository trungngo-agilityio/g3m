part of g3.stimpack.model;

/// The pre-defined set of types, commonly used for modeling.
class StimModelTypes {
  StimModelType tag,
      name,
      nameSet,
      funcCode,
      funcCodeSet,
      tagSet,
      type,
      typeSet,
      package,
      packageSet,
      field,
      fieldSet,
      filter,
      filterSet,
      pattern,
      patternSet,
      range,
      rangeSet,
      fieldRule,
      fieldRuleSet,
      error,
      errorSet,
      httpStatus,
      httpStatusSet,
      grpcStatus,
      grpcStatusSet;
}

// Reusable type mirror fo StimSymbol type.
TypeMirror _stimSymbolType;

// Pattern to split type name string to a bag of words.
RegExp _splitTypeNameRegEx = RegExp('[A-Z][^A-Z]*');

class StimModelTypeScope {
  StimModelType string,
      num,
      int,
      double,
      bool,
      duration,
      uri,
      dateTime,
      type,
      map,
      list,
      set;

  Set<StimModelType> primitiveTypes;
  Set<StimModelType> numberTypes;
  Set<StimModelType> collectionTypes;

  /// Provides meta information for the model package.
  StimModelTypes model;

  /// The internal map of dart types created via the scope.
  Map<TypeMirror, StimModelType> _dartTypes;

  StimModelType of({
    @meta.required dynamic name,
    Set<StimModelTag> tags,
    @meta.required StimModelPackage package,
    Set<StimModelType> mixins,
    Set<StimModelField> fields,
    Set<StimModelFilter> filters,
  }) {
    final res = StimModelType()
      ..name = StimName.of(name)
      ..package = package
      ..mixins = mixins
      ..fields = fields
      ..filters = filters
      ..tags = tags;

    // Adds the type to the package if that is specified.
    package?.types += res;
    return res;
  }

  StimModelType primitiveOf({
    dynamic name,
    @meta.required StimModelPackage package,
  }) {
    return of(name: name, package: package, fields: null);
  }

  StimModelType fromDart(
    Type type, {
    Set<StimModelFilter> filters,
    Set<StimModelTag> tags,
  }) {
    _dartTypes ??= {};
    var stimType = _dartTypes[type];

    // Only creates one instance for a dart type.
    if (stimType != null) return stimType;

    final rt = reflectType(type);

    // Figure out the packages own this type.
    var library = rt.owner;
    while (library != null && library is! LibraryMirror) {
      library = library.owner;
    }

    assert(library != null, 'BUG. We need to be able to find the library');

    final package = stimpack.model.package.fromDart(library);
    var uri = package.dartLibrary.uri;
    var scheme = uri?.scheme;
    assert(
      scheme == 'package' || scheme == 'dart',
      'cannot import ${type} from "${scheme}" scheme, '
      'with uri: ${uri}',
    );

    final typeName = type.toString();

    // Handles the edge case where the type is actually the
    // dart version of a model type. In this case, we should not
    // create a new instance,and reuse the existing model type
    // instead. First check, if that has common prefix.
    if (typeName.startsWith('Stim')) {
      // Second potential match. The targeted type is a symbol.
      // Let's check the dart package to see if that does come
      // from the stimpack engine or not.
      _stimSymbolType ??= reflectType(StimSymbol);
      if (rt.isSubtypeOf(_stimSymbolType)) {
        final matches = _splitTypeNameRegEx.allMatches(typeName);
        if (matches.length > 2) {
          // now continue looking into it to see if the second part
          // is a pack.
          final m1 = matches.elementAt(1);
          final potentialPackName =
              typeName.substring(m1.start, m1.end).toLowerCase();

          // just get the remaining as a symbol
          final m2 = matches.elementAt(2);
          var potentialSymbolName = typeName.substring(m2.start);
          potentialSymbolName = potentialSymbolName[0].toLowerCase() +
              potentialSymbolName.substring(1);

          final s =
              'stimpack.model.type.${potentialPackName}.${potentialSymbolName}';

          assert(false, 'Please use $s instead of a dart type name.');
        }

        // now just use magic symbol to figure out if possible
      }
    }

    stimType ??= StimModelType()
      ..name = StimName.of(typeName)
      ..package = package
      ..dartType = rt
      ..filters = filters ?? {}
      ..tags = tags ?? {};

    return _dartTypes[rt] = stimType;
  }

  StimModelType collectionOf({
    dynamic name,
    Set<StimModelTag> tags,
    @meta.required StimModelPackage package,
    @meta.required Set<StimModelField> fields,
    @meta.required StimModelType collection,
    @meta.required StimModelType item,
    Set<StimModelType> mixins,
  }) {
    assert(collection != null, 'collection is required');
    assert(item != null, 'item is required');

    return of(
      name: name,
      tags: tags,
      package: package,
      fields: fields,
      mixins: mixins,
    )
      ..collection = collection
      ..item = item;
  }

  StimModelType listOf({
    dynamic name,
    Set<StimModelTag> tags,
    @meta.required StimModelType item,
    Set<StimModelType> mixins,
  }) {
    assert(item != null, 'item is required');
    final list = stimpack.model.type.list;
    return collectionOf(
      name: name ?? list.name >> '<' >> item.name >> '>',
      package: list.package,
      fields: list.fields,
      collection: list,
      item: item,
    );
  }

  StimModelType setOf({
    dynamic name,
    Set<StimModelTag> tags,
    @meta.required StimModelType item,
    Set<StimModelType> mixins,
  }) {
    final set = stimpack.model.type.set;
    return collectionOf(
      name: name ?? set.name >> '<' >> item.name >> '>',
      package: set.package,
      fields: set.fields,
      collection: set,
      item: item,
    );
  }
}

class StimModelType extends StimModelSymbol<StimModelType> {
  /// A model might belong to a package.
  StimModelPackage package;

  /// The list of mixins types. Given this list, the actual list
  /// of declared fields might be different from the list of instance fields,
  /// which is the union of all fields defined in both the current class
  /// and its mixins.
  Set<StimModelType> mixins;

  /// The list of declared fields for this type.
  Set<StimModelField> fields;

  /// The set of filters can be applied to this type.
  Set<StimModelFilter> filters;

  /// This is only used for collection type.
  StimModelType collection;

  /// This is only used for collection type.
  StimModelType item;

  /// This field is only not null when the type is come from
  /// a dart type. In this case, the [package] should points
  /// to a [StimModelPackage] that is also from a dart library.
  TypeMirror dartType;

  /// True indicates that this is a collection type.
  bool get isCollection => collection != null;

  bool get isDartSet => collection == _model.type.set;

  bool get isDartList => collection == _model.type.list;

  /// Determines if this field is a dart number type, which could
  /// be int, double, ...
  bool get isDartNumber => _model.type.numberTypes.contains(this);

  /// Determines if this field is a dart string type.
  bool get isDartString => _model.type.string == this;

  /// Determines if this field is a dart bool type.
  bool get isDartBool => _model.type.bool == this;

  /// Determines if this field is a dart duration type.
  bool get isDartDuration => _model.type.duration == this;

  /// Determines if this field is a dart date time type.
  bool get isDartDateTime => _model.type.dateTime == this;

  /// True indicates that this type is from the dart type system.
  /// It is a not a user-defined type.
  bool get isDart => dartType != null;

  StimModelType();
}
