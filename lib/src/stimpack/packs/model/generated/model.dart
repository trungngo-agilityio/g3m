library g3.stimpack.model.generated;

import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

part 'model_field.dart';

part 'model_field__rules.dart';

part 'model_field__type.dart';

part 'model_pattern.dart';

part 'model_range.dart';

part 'model_rule.dart';

part 'model_rule__patterns.dart';

part 'model_rule__range.dart';

part 'model_type.dart';

part 'model_type__fields.dart';

part 'model_type__rules.dart';

StimModelModel _stimModelModel;

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

  StimModelPatternScope get pattern;

  StimModelRangeScope get range;
}

class _StimModelModelImpl implements StimModelModel {
  StimMetaPack _meta;

  _StimModelTypeScopeImpl _type;

  _StimModelFieldScopeImpl _field;

  _StimModelRuleScopeImpl _rule;

  _StimModelPatternScopeImpl _pattern;

  _StimModelRangeScopeImpl _range;

  @override
  StimMetaPack get meta => _meta;

  @override
  StimModelTypeScope get type => _type;

  @override
  StimModelFieldScope get field => _field;

  @override
  StimModelRuleScope get rule => _rule;

  @override
  StimModelPatternScope get pattern => _pattern;

  @override
  StimModelRangeScope get range => _range;

  _StimModelModelImpl() {
    _type = _StimModelTypeScopeImpl._(this);
    _field = _StimModelFieldScopeImpl._(this);
    _rule = _StimModelRuleScopeImpl._(this);
    _pattern = _StimModelPatternScopeImpl._(this);
    _range = _StimModelRangeScopeImpl._(this);
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
    final f = meta.field, t = meta.type, p = meta.preset, v = meta.value;
    final listKind = meta.kind.s.list;

    final typeType = t.of('type');
    final fieldType = t.of('field');
    final ruleType = t.of('rule');
    final patternType = t.of('pattern');
    final rangeType = t.of('range');

    typeType.fields += f.of('fields', kind: listKind, type: fieldType) +
        f.of('rules', kind: listKind, type: ruleType);

    fieldType.fields += f.of('type', type: typeType) +
        f.of('rules', kind: listKind, type: ruleType);

    ruleType.fields += f.of('range', type: rangeType) +
        f.of('patterns', kind: listKind, type: patternType);

    typeType.presets += p.of(
          'grpc',
          values: v.of('double') +
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
              v.of('bytes'),
        ) +
        p.of(
          'date',
          values: v.of('timestamp') +
              v.of('date') +
              v.of('time') +
              v.of('datetime') +
              v.of('local date') +
              v.of('local time') +
              v.of('local datetime'),
        ) +
        p.of(
          'auth',
          values: v.of('user') + v.of('user profile') + v.of('access token'),
        ) +
        p.of(
          'common',
          values: v.of('url'),
        );

    fieldType.presets += p.of(
          'user',
          values: v.of('user id') +
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
              v.of('avatar url'),
        ) +
        p.of(
          'pagination',
          values: v.of('total') +
              v.of('count') +
              v.of('size') +
              v.of('index') +
              v.of('page size') +
              v.of('page index') +
              v.of('offset') +
              v.of('limit'),
        ) +
        p.of(
          'db',
          values: v.of('id') +
              v.of('created at') +
              v.of('modified at') +
              v.of('version'),
        );

    ruleType.presets += p.of(
          '',
          values: v.of('unique') + v.of('required'),
        ) +
        p.of(
          'validation',
          values: v.of('text') +
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
              v.of('alpha'),
        );

    patternType.presets += p.of(
      'validation',
      values: v.of('id') +
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
          v.of('alpha'),
    );

    final allTypes = typeType + fieldType + ruleType + patternType + rangeType;
    _meta = meta.pack.of('model', types: allTypes);
    allTypes.pack.set(_meta);
  }

  // region custom code of model stimpack

  /// This function shall be call during the init process.
  void _buildValues() {
    _buildFields();
  }

  void _buildFields() {
    final fu = _field.s.user, fdb = _field.s.db, grpc = _type.s.grpc;

    var stringFields = fu.userId +
        fu.userName +
        fu.email +
        fu.emailVerified +
        fu.phone +
        fu.password +
        fu.name +
        fu.desc +
        fu.firstName +
        fu.lastName +
        fu.middleName;
    stringFields += fdb.version + fdb.id;
    var dateFields = fu.birthday;
    var timestampFields = fdb.createdAt + fdb.modifiedAt;

    stringFields.type ^ grpc.string;
    dateFields.type = _type.s.date.date;
    timestampFields.type ^ _type.s.date.timestamp;

    // all db field is int type
//    fdb.all.type  grpc.int32;
  }

// endregion custom code of model stimpack
}
