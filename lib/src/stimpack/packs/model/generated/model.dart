library g3.stimpack.model.generated;


import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';
part 'model_presets.dart';
part '../model_init.dart';
part 'model__type.dart';
part 'model__type__fields.dart';
part 'model__type__rules.dart';
part 'model__field.dart';
part 'model__field__type.dart';
part 'model__field__rules.dart';
part 'model__rule.dart';
part 'model__rule__range.dart';
part 'model__rule__patterns.dart';
part 'model__pattern.dart';
part 'model__range.dart';



abstract class StimModel {
  StimMetaPack get meta;
  StimModelTypeScope get type;
  StimModelFieldScope get field;
  StimModelRuleScope get rule;
  StimModelPatternScope get pattern;
  StimModelRangeScope get range;
}


class StimModelImpl  implements StimModel {
  StimMetaPack _meta;

  _StimModelTypeScopeImpl _type;

  _StimModelFieldScopeImpl _field;

  _StimModelRuleScopeImpl _rule;

  _StimModelPatternScopeImpl _pattern;

  _StimModelRangeScopeImpl _range;

  StimMetaXTypeXPreset _metaXTypeXPreset;

  StimModelXRuleXValidationPreset _ruleXValidationPreset;

  StimModelXPatternXValidationPreset _patternXValidationPreset;

  StimModelXFieldXUserPreset _fieldXUserPreset;

  StimModelXFieldXPaginationPreset _fieldXPaginationPreset;

  StimModelXFieldXDbPreset _fieldXDbPreset;

  StimModelXTypeXGrpcPreset _typeXGrpcPreset;

  StimModelXTypeXDatePreset _typeXDatePreset;

  StimModelXTypeXAuthPreset _typeXAuthPreset;

  StimModelXTypeXCommonPreset _typeXCommonPreset;

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

  StimModelImpl() {
    _type = _StimModelTypeScopeImpl();
    _field = _StimModelFieldScopeImpl();
    _rule = _StimModelRuleScopeImpl();
    _pattern = _StimModelPatternScopeImpl();
    _range = _StimModelRangeScopeImpl();
    _metaXTypeXPreset = StimMetaXTypeXPreset();
    _ruleXValidationPreset = StimModelXRuleXValidationPreset();
    _patternXValidationPreset = StimModelXPatternXValidationPreset();
    _fieldXUserPreset = StimModelXFieldXUserPreset();
    _fieldXPaginationPreset = StimModelXFieldXPaginationPreset();
    _fieldXDbPreset = StimModelXFieldXDbPreset();
    _typeXGrpcPreset = StimModelXTypeXGrpcPreset();
    _typeXDatePreset = StimModelXTypeXDatePreset();
    _typeXAuthPreset = StimModelXTypeXAuthPreset();
    _typeXCommonPreset = StimModelXTypeXCommonPreset();
  }


  void init() {
    _type.init();
    _field.init();
    _rule.init();
    _pattern.init();
    _range.init();
    _metaXTypeXPreset.init(stimpack.meta.type);
    _ruleXValidationPreset.init(_rule);
    _patternXValidationPreset.init(_pattern);
    _fieldXUserPreset.init(_field);
    _fieldXPaginationPreset.init(_field);
    _fieldXDbPreset.init(_field);
    _typeXGrpcPreset.init(_type);
    _typeXDatePreset.init(_type);
    _typeXAuthPreset.init(_type);
    _typeXCommonPreset.init(_type);
    _buildMeta();
    stimInitModelPack(this);
  }

  void _buildMeta() {
    final meta = stimpack.meta;
    final pack = meta.pack.of('model');
    final f = meta.field, t = meta.type, p = meta.preset, v = meta.value;
    final setKind = meta.kind.forMeta.set;

    t.forModel.type.fields = f.noneSet +
        f.of('fields', kind: setKind, type: t.forModel.field) + 
        f.of('rules', kind: setKind, type: t.forModel.rule);

    t.forModel.field.fields = f.noneSet +
        f.of('type', type: t.forModel.type) + 
        f.of('rules', kind: setKind, type: t.forModel.rule);

    t.forModel.rule.fields = f.noneSet +
        f.of('range', kind: setKind, type: t.forModel.range) + 
        f.of('patterns', kind: setKind, type: t.forModel.pattern);

    pack.presets = p.noneSet +
        p.of('', type: t.forMeta.type, values: 
              v.of('type') + 
              v.of('field') + 
              v.of('rule') + 
              v.of('pattern') + 
              v.of('range'),)
         + 
        p.of('validation', type: t.forModel.rule, values: 
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
        p.of('validation', type: t.forModel.pattern, values: 
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
        p.of('user', type: t.forModel.field, values: 
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
        p.of('pagination', type: t.forModel.field, values: 
              v.of('total') + 
              v.of('count') + 
              v.of('size') + 
              v.of('index') + 
              v.of('page size') + 
              v.of('page index') + 
              v.of('offset') + 
              v.of('limit'),)
         + 
        p.of('db', type: t.forModel.field, values: 
              v.of('id') + 
              v.of('created at') + 
              v.of('modified at') + 
              v.of('version'),)
         + 
        p.of('grpc', type: t.forModel.type, values: 
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
        p.of('date', type: t.forModel.type, values: 
              v.of('timestamp') + 
              v.of('date') + 
              v.of('time') + 
              v.of('datetime') + 
              v.of('local date') + 
              v.of('local time') + 
              v.of('local datetime'),)
         + 
        p.of('auth', type: t.forModel.type, values: 
              v.of('user') + 
              v.of('user profile') + 
              v.of('access token'),)
         + 
        p.of('common', type: t.forModel.type, values: 
              v.of('url'),);

    pack.types = t.forModel.all;
    pack.types.pack.set(pack);
    _meta = pack;
  }
}
StimModel  _stimModel;

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
    