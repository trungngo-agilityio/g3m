part of g3.stimpack.model.generated;



class StimModelRuleValidationPreset {
  StimModelRuleSet all;

  StimModelRule unique;

  StimModelRule required;

  StimModelRule text;

  StimModelRule desc;

  StimModelRule longText;

  StimModelRule shortText;

  StimModelRule id;

  StimModelRule uuidV4;

  StimModelRule slug;

  StimModelRule ipv4;

  StimModelRule ipv6;

  StimModelRule ip;

  StimModelRule url;

  StimModelRule email;

  StimModelRule username;

  StimModelRule password;

  StimModelRule phone;

  StimModelRule alpha;


  StimModelRuleValidationPreset(StimModelRuleScope scope) {
    all = scope.noneSet;
    all += unique = scope.of('unique');
    all += required = scope.of('required');
    all += text = scope.of('text');
    all += desc = scope.of('desc');
    all += longText = scope.of('long text');
    all += shortText = scope.of('short text');
    all += id = scope.of('id');
    all += uuidV4 = scope.of('uuid v4');
    all += slug = scope.of('slug');
    all += ipv4 = scope.of('ipv4');
    all += ipv6 = scope.of('ipv6');
    all += ip = scope.of('ip');
    all += url = scope.of('url');
    all += email = scope.of('email');
    all += username = scope.of('username');
    all += password = scope.of('password');
    all += phone = scope.of('phone');
    all += alpha = scope.of('alpha');
  }
}


class StimModelPatternValidationPreset {
  StimModelPatternSet all;

  StimModelPattern id;

  StimModelPattern uuidV4;

  StimModelPattern slug;

  StimModelPattern ipv4;

  StimModelPattern ipv6;

  StimModelPattern ip;

  StimModelPattern url;

  StimModelPattern email;

  StimModelPattern username;

  StimModelPattern password;

  StimModelPattern phone;

  StimModelPattern alpha;


  StimModelPatternValidationPreset(StimModelPatternScope scope) {
    all = scope.noneSet;
    all += id = scope.of('id');
    all += uuidV4 = scope.of('uuid v4');
    all += slug = scope.of('slug');
    all += ipv4 = scope.of('ipv4');
    all += ipv6 = scope.of('ipv6');
    all += ip = scope.of('ip');
    all += url = scope.of('url');
    all += email = scope.of('email');
    all += username = scope.of('username');
    all += password = scope.of('password');
    all += phone = scope.of('phone');
    all += alpha = scope.of('alpha');
  }
}


class StimModelFieldUserPreset {
  StimModelFieldSet all;

  StimModelField userId;

  StimModelField userName;

  StimModelField email;

  StimModelField emailVerified;

  StimModelField phone;

  StimModelField phoneVerified;

  StimModelField password;

  StimModelField confirmPassword;

  StimModelField name;

  StimModelField desc;

  StimModelField firstName;

  StimModelField lastName;

  StimModelField middleName;

  StimModelField gender;

  StimModelField birthday;

  StimModelField photoUrl;

  StimModelField avatarUrl;


  StimModelFieldUserPreset(StimModelFieldScope scope) {
    all = scope.noneSet;
    all += userId = scope.of('user id');
    all += userName = scope.of('user name');
    all += email = scope.of('email');
    all += emailVerified = scope.of('email verified');
    all += phone = scope.of('phone');
    all += phoneVerified = scope.of('phone verified');
    all += password = scope.of('password');
    all += confirmPassword = scope.of('confirm password');
    all += name = scope.of('name');
    all += desc = scope.of('desc');
    all += firstName = scope.of('first name');
    all += lastName = scope.of('last name');
    all += middleName = scope.of('middle name');
    all += gender = scope.of('gender');
    all += birthday = scope.of('birthday');
    all += photoUrl = scope.of('photo url');
    all += avatarUrl = scope.of('avatar url');
  }
}


class StimModelFieldPaginationPreset {
  StimModelFieldSet all;

  StimModelField total;

  StimModelField count;

  StimModelField size;

  StimModelField index;

  StimModelField pageSize;

  StimModelField pageIndex;

  StimModelField offset;

  StimModelField limit;


  StimModelFieldPaginationPreset(StimModelFieldScope scope) {
    all = scope.noneSet;
    all += total = scope.of('total');
    all += count = scope.of('count');
    all += size = scope.of('size');
    all += index = scope.of('index');
    all += pageSize = scope.of('page size');
    all += pageIndex = scope.of('page index');
    all += offset = scope.of('offset');
    all += limit = scope.of('limit');
  }
}


class StimModelFieldDbPreset {
  StimModelFieldSet all;

  StimModelField id;

  StimModelField createdAt;

  StimModelField modifiedAt;

  StimModelField version;


  StimModelFieldDbPreset(StimModelFieldScope scope) {
    all = scope.noneSet;
    all += id = scope.of('id');
    all += createdAt = scope.of('created at');
    all += modifiedAt = scope.of('modified at');
    all += version = scope.of('version');
  }
}


class StimModelTypeGrpcPreset {
  StimModelTypeSet all;

  StimModelType double;

  StimModelType float;

  StimModelType int32;

  StimModelType int64;

  StimModelType uint32;

  StimModelType uint64;

  StimModelType sint32;

  StimModelType sint64;

  StimModelType fixed32;

  StimModelType fixed64;

  StimModelType sfixed32;

  StimModelType sfixed64;

  StimModelType string;

  StimModelType bytes;


  StimModelTypeGrpcPreset(StimModelTypeScope scope) {
    all = scope.noneSet;
    all += double = scope.of('double');
    all += float = scope.of('float');
    all += int32 = scope.of('int32');
    all += int64 = scope.of('int64');
    all += uint32 = scope.of('uint32');
    all += uint64 = scope.of('uint64');
    all += sint32 = scope.of('sint32');
    all += sint64 = scope.of('sint64');
    all += fixed32 = scope.of('fixed32');
    all += fixed64 = scope.of('fixed64');
    all += sfixed32 = scope.of('sfixed32');
    all += sfixed64 = scope.of('sfixed64');
    all += string = scope.of('string');
    all += bytes = scope.of('bytes');
  }
}


class StimModelTypeDatePreset {
  StimModelTypeSet all;

  StimModelType timestamp;

  StimModelType date;

  StimModelType time;

  StimModelType datetime;

  StimModelType localDate;

  StimModelType localTime;

  StimModelType localDatetime;


  StimModelTypeDatePreset(StimModelTypeScope scope) {
    all = scope.noneSet;
    all += timestamp = scope.of('timestamp');
    all += date = scope.of('date');
    all += time = scope.of('time');
    all += datetime = scope.of('datetime');
    all += localDate = scope.of('local date');
    all += localTime = scope.of('local time');
    all += localDatetime = scope.of('local datetime');
  }
}


class StimModelTypeAuthPreset {
  StimModelTypeSet all;

  StimModelType user;

  StimModelType userProfile;

  StimModelType accessToken;


  StimModelTypeAuthPreset(StimModelTypeScope scope) {
    all = scope.noneSet;
    all += user = scope.of('user');
    all += userProfile = scope.of('user profile');
    all += accessToken = scope.of('access token');
  }
}


class StimModelTypeCommonPreset {
  StimModelTypeSet all;

  StimModelType url;


  StimModelTypeCommonPreset(StimModelTypeScope scope) {
    all = scope.noneSet;
    all += url = scope.of('url');
  }
}


class StimMetaTypeModelPreset {
  StimMetaTypeSet all;

  StimMetaType type;

  StimMetaType field;

  StimMetaType rule;

  StimMetaType pattern;

  StimMetaType range;


  StimMetaTypeModelPreset(StimMetaTypeScope scope) {
    all = scope.noneSet;
    all += type = scope.of('type');
    all += field = scope.of('field');
    all += rule = scope.of('rule');
    all += pattern = scope.of('pattern');
    all += range = scope.of('range');
  }
}
StimModelRuleValidationPreset  _extStimModelRuleValidationPreset;

extension StimModelRuleValidationPresetExtension on StimModelRuleScope {
  StimModelRuleValidationPreset get forValidation {
    return _extStimModelRuleValidationPreset ??= StimModelRuleValidationPreset(stimpack.model.rule);
  }
}
    
StimModelPatternValidationPreset  _extStimModelPatternValidationPreset;

extension StimModelPatternValidationPresetExtension on StimModelPatternScope {
  StimModelPatternValidationPreset get forValidation {
    return _extStimModelPatternValidationPreset ??= StimModelPatternValidationPreset(stimpack.model.pattern);
  }
}
    
StimModelFieldUserPreset  _extStimModelFieldUserPreset;

extension StimModelFieldUserPresetExtension on StimModelFieldScope {
  StimModelFieldUserPreset get forUser {
    return _extStimModelFieldUserPreset ??= StimModelFieldUserPreset(stimpack.model.field);
  }
}
    
StimModelFieldPaginationPreset  _extStimModelFieldPaginationPreset;

extension StimModelFieldPaginationPresetExtension on StimModelFieldScope {
  StimModelFieldPaginationPreset get forPagination {
    return _extStimModelFieldPaginationPreset ??= StimModelFieldPaginationPreset(stimpack.model.field);
  }
}
    
StimModelFieldDbPreset  _extStimModelFieldDbPreset;

extension StimModelFieldDbPresetExtension on StimModelFieldScope {
  StimModelFieldDbPreset get forDb {
    return _extStimModelFieldDbPreset ??= StimModelFieldDbPreset(stimpack.model.field);
  }
}
    
StimModelTypeGrpcPreset  _extStimModelTypeGrpcPreset;

extension StimModelTypeGrpcPresetExtension on StimModelTypeScope {
  StimModelTypeGrpcPreset get forGrpc {
    return _extStimModelTypeGrpcPreset ??= StimModelTypeGrpcPreset(stimpack.model.type);
  }
}
    
StimModelTypeDatePreset  _extStimModelTypeDatePreset;

extension StimModelTypeDatePresetExtension on StimModelTypeScope {
  StimModelTypeDatePreset get forDate {
    return _extStimModelTypeDatePreset ??= StimModelTypeDatePreset(stimpack.model.type);
  }
}
    
StimModelTypeAuthPreset  _extStimModelTypeAuthPreset;

extension StimModelTypeAuthPresetExtension on StimModelTypeScope {
  StimModelTypeAuthPreset get forAuth {
    return _extStimModelTypeAuthPreset ??= StimModelTypeAuthPreset(stimpack.model.type);
  }
}
    
StimModelTypeCommonPreset  _extStimModelTypeCommonPreset;

extension StimModelTypeCommonPresetExtension on StimModelTypeScope {
  StimModelTypeCommonPreset get forCommon {
    return _extStimModelTypeCommonPreset ??= StimModelTypeCommonPreset(stimpack.model.type);
  }
}
    
StimMetaTypeModelPreset  _extStimMetaTypeModelPreset;

extension StimMetaTypeModelPresetExtension on StimMetaTypeScope {
  StimMetaTypeModelPreset get forModel {
    return _extStimMetaTypeModelPreset ??= StimMetaTypeModelPreset(stimpack.meta.type);
  }
}
    