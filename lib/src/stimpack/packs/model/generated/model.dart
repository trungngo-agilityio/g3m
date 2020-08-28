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
    _buildValues();
  }

  void _buildMeta() {
    final meta = stimpack.meta;
    final f = meta.field, t = meta.type, p = meta.preset, v = meta.value;
    final listKind = meta.kind.s.list;

    final typeType = t.of('type');
    final fieldType = t.of('field');
    final ruleType = t.of('rule');

    typeType.fields += 
        f.of('fields', kind: listKind, type: fieldType) + 
        f.of('rules', kind: listKind, type: ruleType);

    fieldType.fields += 
        f.of('type', type: typeType) + 
        f.of('rules', kind: listKind, type: ruleType);

    typeType.presets += 
        p.of('', values: 
              v.of('double') + 
              v.of('float') + 
              v.of('int32') + 
              v.of('int64'),);

    fieldType.presets += 
        p.of('grpc', values: 
              v.of('first name') + 
              v.of('last name'),);

    ruleType.presets += 
        p.of('', values: 
              v.of('required') + 
              v.of('unique'),);

    _meta = meta.pack.of('model', types: typeType + fieldType + ruleType);
  }
  
  // region custom code of model stimpack

  /// This function shall be call during the init process.
  void _buildValues() {
    _type.s.int32.rules += _rule.s.required;
    _field.s.grpc.firstName.rules += _rule.s.required;
  }
// endregion custom code of model stimpack
}
    