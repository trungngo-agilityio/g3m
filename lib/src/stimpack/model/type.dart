part of g3.stimpack.model;

class StimModelTypes {
  StimModelType tag, tagSet, type, typeSet, package;
}

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
  Set<StimModelType> collectionTypes;

  // Provides meta information for the model package.
  StimModelTypes model;

  StimModelType of({
    @meta.required dynamic name,
    Set<StimModelTag> tags,
    @meta.required StimModelPackage package,
    Set<StimModelType> mixins,
    Set<StimModelField> fields,
  }) {
    final res = StimModelType()
      ..name = StimName.of(name)
      ..tags = tags
      ..package = package
      ..mixins = mixins
      ..fields = fields;

    package?.types += res;
    return res;
  }

  StimModelType primitiveOf({
    dynamic name,
    @meta.required StimModelPackage package,
  }) {
    return of(name: name, package: package, fields: null);
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

  /// This is only used for collection type.
  StimModelType collection;

  /// This is only used for collection type.
  StimModelType item;

  /// True indicates that this is a collection type.
  bool get isCollection => collection != null;

  bool get isDartSet => collection == stimpack.model.type.set;

  bool get isDartList => collection == stimpack.model.type.list;

  StimModelTypeRef _ref;

  /// Gets the reference to this model.
  StimModelType get ref => _ref ??= StimModelTypeRef()..symbol = this;

  StimModelType();
}

class StimModelTypeRef extends StimSymbolRef<StimModelType>
    implements StimModelType {}
