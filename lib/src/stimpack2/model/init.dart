part of g3.stimpack2.model;

StimModel _model;

extension StimModelExtension on Stimpack {
  StimModel get model {
    return _model ??= StimModel();
  }
}

class StimModel extends StimPack {
  final StimModelPackageScope package;
  final StimModelTagScope tag;
  final StimModelTypeScope type;
  final StimModelFieldScope field;
  final StimModelFieldRuleScope rule;
  final StimModelPatternScope pattern;
  final StimModelRangeScope range;

  StimModel()
      : package = StimModelPackageScope(),
        tag = StimModelTagScope(),
        type = StimModelTypeScope(),
        field = StimModelFieldScope(),
        rule = StimModelFieldRuleScope(),
        pattern = StimModelPatternScope(),
        range = StimModelRangeScope(),
        super('model') {
    _patterns();
    _ranges();
    _rules();
    _packages();
    _primitiveTypes();
    _collectionTypes();
  }

  void _patterns() {}

  void _ranges() {}

  void _rules() {
    rule
      ..required = rule.of(name: 'required')
      ..unique = rule.of(name: 'unique');
  }

  void _packages() {
    package..dart = package.of(name: 'dart');
  }

  void _primitiveTypes() {
    final t = type;
    t.primitiveTypes = {
      t.num = _t('num'),
      t.int = _t('int'),
      t.double = _t('double'),
      t.bool = _t('bool'),
      t.duration = _t('duration'),
      t.uri = _t('date time'),
      t.type = _t('type'),
    };
  }

  void _collectionTypes() {
    final t = type;
    t.collectionTypes = {
      t.map = _t('map'),
      t.list = _t('list'),
      t.set = _t('set')
    };
  }

  StimModelType _t(String name) =>
      type.primitiveOf(name: name, package: package.dart);
}
