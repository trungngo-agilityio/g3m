part of g3.stimpack.meta;

extension StimMetaExtensionOnModelTypeScope on StimModelTypeScope {
  StimModelType symbolOf({
    @required dynamic name,
    @required StimModelPackage package,
    Set<StimModelField> fields,
  }) {
    assert(package != null, 'package is required');
    assert(package.name?.isNotEmpty == true, 'package name is required');

    final res = StimModelType()
      ..name = 'stim ' >> package.name >> StimName.of(name)
      // adds a tag for the meta value.
      ..package = package
      ..fields = fields;

    package?.types += res;
    return res;
  }
}
