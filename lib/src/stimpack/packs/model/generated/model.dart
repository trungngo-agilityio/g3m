library g3.stimpack.model.generated;


import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';
part 'model_presets.dart';
part 'model_type.dart';
part 'model_type__fields.dart';
part 'model_type__rules.dart';
part 'model_field.dart';
part 'model_field__type.dart';
part 'model_field__rules.dart';
part 'model_rule.dart';
part 'model_rule__range.dart';
part 'model_rule__patterns.dart';
part 'model_pattern.dart';
part 'model_range.dart';



abstract class StimModelModel {
  StimMetaPack get meta;
  StimModelTypeScope get type;
  StimModelFieldScope get field;
  StimModelRuleScope get rule;
  StimModelPatternScope get pattern;
  StimModelRangeScope get range;
}


class _StimModelModelImpl  implements StimModelModel {
  StimMetaPack _meta;

  _StimModelTypeScopeImpl _type;

  _StimModelFieldScopeImpl _field;

  _StimModelRuleScopeImpl _rule;

  _StimModelPatternScopeImpl _pattern;

  _StimModelRangeScopeImpl _range;

  @override
  StimMetaPack get meta {
    return _meta;
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

  _StimModelModelImpl() {
    _type = _StimModelTypeScopeImpl();
    _field = _StimModelFieldScopeImpl();
    _rule = _StimModelRuleScopeImpl();
    _pattern = _StimModelPatternScopeImpl();
    _range = _StimModelRangeScopeImpl();
  }


  void init() {
    _type.init();
    _field.init();
    _rule.init();
    _pattern.init();
    _range.init();
    _buildMeta();
    _buildValues();
  }

  void _buildMeta() {
    final meta = stimpack.meta;
    final pack = stimpack.meta.pack.of('model');
    final f = meta.field, t = meta.type.forModel, p = meta.preset, v = meta.value;
    final listKind = meta.kind.forMeta.list;

    final  typeType = t.type;
    final  fieldType = t.field;
    final  ruleType = t.rule;
    final  patternType = t.pattern;
    final  rangeType = t.range;

    typeType.fields += 
        f.of('fields', kind: listKind, type: fieldType) + 
        f.of('rules', kind: listKind, type: ruleType);

    fieldType.fields += 
        f.of('type', type: typeType) + 
        f.of('rules', kind: listKind, type: ruleType);

    ruleType.fields += 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType);

    pack.presets += 
        p.of('validation', type: stimpack.meta.type.forModel.rule, values: 
              v.of('unique') + 
              v.of('required') + 
              v.of('text') + 
              v.of('desc') + 
              v.of('long text') + 
              v.of('short text') + 
              v.of('id') + 
              v.of('uuid v4') + 
              v.of('slug') + 
              v.of('ipv4') + 
              v.of('ipv6') + 
              v.of('ip') + 
              v.of('url') + 
              v.of('email') + 
              v.of('username') + 
              v.of('password') + 
              v.of('phone') + 
              v.of('alpha'),)
         + 
        p.of('validation', type: stimpack.meta.type.forModel.pattern, values: 
              v.of('id') + 
              v.of('uuid v4') + 
              v.of('slug') + 
              v.of('ipv4') + 
              v.of('ipv6') + 
              v.of('ip') + 
              v.of('url') + 
              v.of('email') + 
              v.of('username') + 
              v.of('password') + 
              v.of('phone') + 
              v.of('alpha'),)
         + 
        p.of('user', type: stimpack.meta.type.forModel.field, values: 
              v.of('user id') + 
              v.of('user name') + 
              v.of('email') + 
              v.of('email verified') + 
              v.of('phone') + 
              v.of('phone verified') + 
              v.of('password') + 
              v.of('confirm password') + 
              v.of('name') + 
              v.of('desc') + 
              v.of('first name') + 
              v.of('last name') + 
              v.of('middle name') + 
              v.of('gender') + 
              v.of('birthday') + 
              v.of('photo url') + 
              v.of('avatar url'),)
         + 
        p.of('pagination', type: stimpack.meta.type.forModel.field, values: 
              v.of('total') + 
              v.of('count') + 
              v.of('size') + 
              v.of('index') + 
              v.of('page size') + 
              v.of('page index') + 
              v.of('offset') + 
              v.of('limit'),)
         + 
        p.of('db', type: stimpack.meta.type.forModel.field, values: 
              v.of('id') + 
              v.of('created at') + 
              v.of('modified at') + 
              v.of('version'),)
         + 
        p.of('grpc', type: stimpack.meta.type.forModel.type, values: 
              v.of('double') + 
              v.of('float') + 
              v.of('int32') + 
              v.of('int64') + 
              v.of('uint32') + 
              v.of('uint64') + 
              v.of('sint32') + 
              v.of('sint64') + 
              v.of('fixed32') + 
              v.of('fixed64') + 
              v.of('sfixed32') + 
              v.of('sfixed64') + 
              v.of('string') + 
              v.of('bytes'),)
         + 
        p.of('date', type: stimpack.meta.type.forModel.type, values: 
              v.of('timestamp') + 
              v.of('date') + 
              v.of('time') + 
              v.of('datetime') + 
              v.of('local date') + 
              v.of('local time') + 
              v.of('local datetime'),)
         + 
        p.of('auth', type: stimpack.meta.type.forModel.type, values: 
              v.of('user') + 
              v.of('user profile') + 
              v.of('access token'),)
         + 
        p.of('common', type: stimpack.meta.type.forModel.type, values: 
              v.of('url'),)
         + 
        p.of('model', type: stimpack.meta.type.forMeta.type, values: 
              v.of('type') + 
              v.of('field') + 
              v.of('rule') + 
              v.of('pattern') + 
              v.of('range'),);

    pack.types += typeType + fieldType + ruleType + patternType + rangeType;
    pack.types.pack.set(pack);
    _meta = pack;
  }
  // region custom code of model stimpack

  /// This function shall be call during the init process.
  void _buildValues() {
    /// build all preset values here
  }

// endregion custom code of model stimpack
}
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
    