part of g3.stimpack.rbac.init;


/// The only instance of the [StimRbac] pack.
StimRbac _rbac;



// Provides global access to the "rbac" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension StimRbacPackExtension on StimpackRoot {
  StimRbac get rbac {
    if (_rbac == null) {
      _rbac = StimRbac.stimRbacInstance();
      _stimInitRbacPack();
    }
    return _rbac;
  }
}
