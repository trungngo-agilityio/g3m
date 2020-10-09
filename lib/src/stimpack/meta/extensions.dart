part of g3.stimpack.meta;

extension OnModelTypeScopeMetaExtension on StimModelTypeScope {

  StimModelType symbolOf({
    @required dynamic name,
    @required StimModelPackage package,
    Set<StimModelType> interfaces,
    Set<StimModelField> fields,
    String comment,
  }) {
    assert(package != null, 'package is required');
    assert(package.name?.isNotEmpty == true, 'package name is required');

    return stimpack.model.type.of(
      name: 'stim ' >> package.name >> StimName.of(name),
      // adds a tag for the meta value.
      package: package,
      fields: fields,
      interfaces: interfaces,
      comment: comment,
    );
  }
}
