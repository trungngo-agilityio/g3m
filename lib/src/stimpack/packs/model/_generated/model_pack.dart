library g3.stimpack.model;

import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

part 'model_type.dart';

part 'model_type__fields.dart';

part 'model_type__rules.dart';

part 'model_field.dart';

part 'model_field__type.dart';

part 'model_field__rules.dart';

part 'model_rule.dart';



_StimModelPackImpl _stimModelPack;

extension StimModelPackExtension on Stimpack {
  _StimModelPack get model {
    return _stimModelPack ??= _StimModelPackImpl();
  }
}

abstract class _StimModelPack {
  StimMetaPack get meta;

  _StimModelTypeScope get type;
  _StimModelFieldScope get field;
  _StimModelRuleScope get rule;
}

class _StimModelPackImpl implements _StimModelPack {
  StimMetaPack _meta;

  _StimModelTypeScopeImpl _type;
  _StimModelFieldScopeImpl _field;
  _StimModelRuleScopeImpl _rule;

  @override
  StimMetaPack get meta => _meta;

  @override
  _StimModelTypeScope get type => _type;
  @override
  _StimModelFieldScope get field => _field;
  @override
  _StimModelRuleScope get rule => _rule;

  _StimModelPackImpl() {
    _type = _StimModelTypeScopeImpl._(this);
    _field = _StimModelFieldScopeImpl._(this);
    _rule = _StimModelRuleScopeImpl._(this);

    _type.init();
    _field.init();
    _rule.init();

    _buildMeta();
  }

  void _buildMeta() {
    final meta = stimpack.meta;
    final listKind = meta.kind.list;

    final typeType = meta.type.of('type');
    final fieldType = meta.type.of('field');
    final ruleType = meta.type.of('rule');

    typeType.fields += 
        meta.field.of('fields', kind: listKind, type: fieldType) + 
        meta.field.of('rules', kind: listKind, type: ruleType);

    fieldType.fields += 
        meta.field.of('type', type: typeType) + 
        meta.field.of('rules', kind: listKind, type: ruleType);

    _meta = meta.pack.of('model', types: typeType + fieldType + ruleType);
  }
}
    