part of g3.stimpack.rbac.generated;



class StimMetaXTypeXPreset {
  StimMetaTypeSet all;

  StimMetaType accessGrant;

  StimMetaType accessRole;

  StimMetaType accessPermission;

  StimMetaType resource;

  StimMetaType action;


  void init(StimMetaTypeScope scope) {
    all = scope.noneSet;
    all += accessGrant = scope.of('accessGrant');
    all += accessRole = scope.of('accessRole');
    all += accessPermission = scope.of('accessPermission');
    all += resource = scope.of('resource');
    all += action = scope.of('action');
  }
}
extension StimMetaXTypeXPresetExtension on StimMetaTypeScope {
  StimMetaXTypeXPreset get forRbac {
    final impl = stimpack.rbac as StimRbacImpl;
    return impl._metaXTypeXPreset; 
  }
}
    