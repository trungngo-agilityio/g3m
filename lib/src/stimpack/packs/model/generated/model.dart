library g3.stimpack.model.generated;


import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

part '../model_init.dart';
part 'model__field.dart';
part 'model__field__rules.dart';
part 'model__field__type.dart';
part 'model__package.dart';
part 'model__package__types.dart';
part 'model__pattern.dart';
part 'model__range.dart';
part 'model__rule.dart';
part 'model__rule__patterns.dart';
part 'model__rule__range.dart';
part 'model__type.dart';
part 'model__type__fields.dart';
part 'model__type__mixins.dart';
part 'model__type__rules.dart';
part 'model_presetsdart';

abstract class StimModel {
  StimMetaPack get meta;

  StimModelPackageScope get package;

  StimModelTypeScope get type;

  StimModelFieldScope get field;

  StimModelRuleScope get rule;

  StimModelPatternScope get pattern;

  StimModelRangeScope get range;
}

class StimModelImpl implements StimModel {
  StimMetaPack _meta;

  _StimModelPackageScopeImpl _package;

  _StimModelTypeScopeImpl _type;

  _StimModelFieldScopeImpl _field;

  _StimModelRuleScopeImpl _rule;

  _StimModelPatternScopeImpl _pattern;

  _StimModelRangeScopeImpl _range;

  StimMetaXTypeXPreset _metaXTypeXPreset;

  @override
  StimMetaPack get meta {
    return _meta;
  }

  @override
  _StimModelPackageScopeImpl get package {
    return _package;
  }

  @override
  _StimModelTypeScopeImpl get type {
    return _type;
  }

  @override
  _StimModelFieldScopeImpl get field {
    return _field;
  }

  @override
  _StimModelRuleScopeImpl get rule {
    return _rule;
  }

  @override
  _StimModelPatternScopeImpl get pattern {
    return _pattern;
  }

  @override
  _StimModelRangeScopeImpl get range {
    return _range;
  }

  StimModelImpl() {
    _package = _StimModelPackageScopeImpl();
    _type = _StimModelTypeScopeImpl();
    _field = _StimModelFieldScopeImpl();
    _rule = _StimModelRuleScopeImpl();
    _pattern = _StimModelPatternScopeImpl();
    _range = _StimModelRangeScopeImpl();
    _metaXTypeXPreset = StimMetaXTypeXPreset();
  }

  void init() {
    _package.init();
    _type.init();
    _field.init();
    _rule.init();
    _pattern.init();
    _range.init();
    _metaXTypeXPreset.init(stimpack.meta.type);
    _buildMeta();
    stimInitModelPack(this);
  }

  void _buildMeta() {
    final meta = stimpack.meta;
    final pack = meta.pack.of('model');
    final f = meta.field,
        t = meta.type,
        p = meta.preset,
        v = meta.value,
        k = meta.kind;

    t.forModel.package.fields =
        f.noneSet + f.of('types', kind: k.set, type: t.forModel.type);

    t.forModel.type.fields = f.noneSet +
        f.of('mixins', kind: k.set, type: t.forModel.type) +
        f.of('fields', kind: k.set, type: t.forModel.field) +
        f.of('rules', kind: k.set, type: t.forModel.rule);

    t.forModel.field.fields = f.noneSet +
        f.of('type', type: t.forModel.type) +
        f.of('rules', kind: k.set, type: t.forModel.rule);

    t.forModel.rule.fields = f.noneSet +
        f.of('range', kind: k.set, type: t.forModel.range) +
        f.of('patterns', kind: k.set, type: t.forModel.pattern);

    pack.presets = p.noneSet +
        p.of(
          '',
          type: t.forMeta.type,
          values: v.of('package') +
              v.of('type') +
              v.of('field') +
              v.of('rule') +
              v.of('pattern') +
              v.of('range'),
        );

    pack.types = t.forModel.all;
    pack.types.pack.set(pack);
    _meta = pack;
  }
}

StimModel _stimModel;

extension StimModelStimpackExtension on Stimpack {
  StimModel get model {
    if (_stimModel == null) {
      final impl = _stimModel = StimModelImpl();
      impl.init();
      return _stimModel;
    }

    return _stimModel;
  }
}
