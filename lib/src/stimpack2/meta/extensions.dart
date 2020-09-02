part of g3.stimpack2.meta;

extension StimMetaExtensionOnModelTypeScope on StimModelTypeScope {

  StimModelType symbolOf({
    @required dynamic name,
    Set<String> values,
    @required StimModelPackage package,
    Set<StimModelType> mixins,
    @required Set<StimModelField> fields,
  }) {
    assert(package != null, 'package is required');
    assert(package.name?.isNotEmpty == true, 'package name is required');
    final res = StimModelType()
      ..name = 'stim ' >> package.name >> StimName.of(name)
      ..tags = values
          ?.map((e) => stimpack.model.tag.of(name: e, value: null))
          ?.toSet()
      ..package = package
      ..mixins = mixins
      ..fields = fields;

    package?.types += res;
    return res;
  }
}
