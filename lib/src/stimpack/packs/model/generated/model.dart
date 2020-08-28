library g3.stimpack.model.generated;

import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

part 'model_type.dart';

part 'model_type__fields.dart';

part 'model_type__rules.dart';

part 'model_field.dart';

part 'model_field__type.dart';

part 'model_field__rules.dart';

part 'model_rule.dart';



StimModelModel  _stimModelModel;

extension StimModelModelExtension on Stimpack {
  StimModelModel get model {
    if (_stimModelModel == null) {
      final impl = _stimModelModel = _StimModelModelImpl();
      impl.init();
      return _stimModelModel;
    }
    
    return _stimModelModel;
  }
}

abstract class StimModelModel {
  StimMetaPack get meta;

  StimModelTypeScope get type;
  StimModelFieldScope get field;
  StimModelRuleScope get rule;

}

class _StimModelModelImpl implements StimModelModel {
  StimMetaPack _meta;

  
  _StimModelTypeScopeImpl _type;
  
  _StimModelFieldScopeImpl _field;
  
  _StimModelRuleScopeImpl _rule;


  @override
  StimMetaPack get meta => _meta;

  
  @override
  StimModelTypeScope get type => _type;
  
  @override
  StimModelFieldScope get field => _field;
  
  @override
  StimModelRuleScope get rule => _rule;

  _StimModelModelImpl() {
    _type = _StimModelTypeScopeImpl._(this);
    _field = _StimModelFieldScopeImpl._(this);
    _rule = _StimModelRuleScopeImpl._(this);

  }
  
  void init() {
    _type.init();
    _field.init();
    _rule.init();

    _buildMeta();
  }

  void _buildMeta() {
    final meta = stimpack.meta;
    final listKind = meta.kind.s.list;

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
    