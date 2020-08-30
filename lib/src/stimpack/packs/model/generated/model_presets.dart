part of g3.stimpack.model.generated;



class StimMetaXTypeXPreset {
  StimMetaTypeSet all;

  StimMetaType type;

  StimMetaType field;

  StimMetaType rule;

  StimMetaType pattern;

  StimMetaType range;


  void init(StimMetaTypeScope scope) {
    all = scope.noneSet;
    all += type = scope.of('type');
    all += field = scope.of('field');
    all += rule = scope.of('rule');
    all += pattern = scope.of('pattern');
    all += range = scope.of('range');
  }
}


class StimModelXRuleXValidationPreset {
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


  void init(StimModelRuleScope scope) {
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


class StimModelXPatternXValidationPreset {
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


  void init(StimModelPatternScope scope) {
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


class StimModelXFieldXUserPreset {
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


  void init(StimModelFieldScope scope) {
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


class StimModelXFieldXPaginationPreset {
  StimModelFieldSet all;

  StimModelField total;

  StimModelField count;

  StimModelField size;

  StimModelField index;

  StimModelField pageSize;

  StimModelField pageIndex;

  StimModelField offset;

  StimModelField limit;


  void init(StimModelFieldScope scope) {
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


class StimModelXFieldXDbPreset {
  StimModelFieldSet all;

  StimModelField id;

  StimModelField createdAt;

  StimModelField modifiedAt;

  StimModelField version;


  void init(StimModelFieldScope scope) {
    all = scope.noneSet;
    all += id = scope.of('id');
    all += createdAt = scope.of('created at');
    all += modifiedAt = scope.of('modified at');
    all += version = scope.of('version');
  }
}


class StimModelXTypeXGrpcPreset {
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


  void init(StimModelTypeScope scope) {
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


class StimModelXTypeXDatePreset {
  StimModelTypeSet all;

  StimModelType timestamp;

  StimModelType date;

  StimModelType time;

  StimModelType datetime;

  StimModelType localDate;

  StimModelType localTime;

  StimModelType localDatetime;


  void init(StimModelTypeScope scope) {
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


class StimModelXTypeXAuthPreset {
  StimModelTypeSet all;

  StimModelType user;

  StimModelType userProfile;

  StimModelType accessToken;


  void init(StimModelTypeScope scope) {
    all = scope.noneSet;
    all += user = scope.of('user');
    all += userProfile = scope.of('user profile');
    all += accessToken = scope.of('access token');
  }
}


class StimModelXTypeXCommonPreset {
  StimModelTypeSet all;

  StimModelType url;


  void init(StimModelTypeScope scope) {
    all = scope.noneSet;
    all += url = scope.of('url');
  }
}
extension StimMetaXTypeXPresetExtension on StimMetaTypeScope {
  StimMetaXTypeXPreset get forModel {
    final impl = stimpack.model as StimModelImpl;
    return impl._metaXTypeXPreset; 
  }
}
    
extension StimModelXRuleXValidationPresetExtension on StimModelRuleScope {
  StimModelXRuleXValidationPreset get forValidation {
    final impl = stimpack.model as StimModelImpl;
    return impl._ruleXValidationPreset; 
  }
}
    
extension StimModelXPatternXValidationPresetExtension on StimModelPatternScope {
  StimModelXPatternXValidationPreset get forValidation {
    final impl = stimpack.model as StimModelImpl;
    return impl._patternXValidationPreset; 
  }
}
    
extension StimModelXFieldXUserPresetExtension on StimModelFieldScope {
  StimModelXFieldXUserPreset get forUser {
    final impl = stimpack.model as StimModelImpl;
    return impl._fieldXUserPreset; 
  }
}
    
extension StimModelXFieldXPaginationPresetExtension on StimModelFieldScope {
  StimModelXFieldXPaginationPreset get forPagination {
    final impl = stimpack.model as StimModelImpl;
    return impl._fieldXPaginationPreset; 
  }
}
    
extension StimModelXFieldXDbPresetExtension on StimModelFieldScope {
  StimModelXFieldXDbPreset get forDb {
    final impl = stimpack.model as StimModelImpl;
    return impl._fieldXDbPreset; 
  }
}
    
extension StimModelXTypeXGrpcPresetExtension on StimModelTypeScope {
  StimModelXTypeXGrpcPreset get forGrpc {
    final impl = stimpack.model as StimModelImpl;
    return impl._typeXGrpcPreset; 
  }
}
    
extension StimModelXTypeXDatePresetExtension on StimModelTypeScope {
  StimModelXTypeXDatePreset get forDate {
    final impl = stimpack.model as StimModelImpl;
    return impl._typeXDatePreset; 
  }
}
    
extension StimModelXTypeXAuthPresetExtension on StimModelTypeScope {
  StimModelXTypeXAuthPreset get forAuth {
    final impl = stimpack.model as StimModelImpl;
    return impl._typeXAuthPreset; 
  }
}
    
extension StimModelXTypeXCommonPresetExtension on StimModelTypeScope {
  StimModelXTypeXCommonPreset get forCommon {
    final impl = stimpack.model as StimModelImpl;
    return impl._typeXCommonPreset; 
  }
}
    