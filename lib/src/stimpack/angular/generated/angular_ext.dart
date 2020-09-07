part of g3.stimpack.angular.init;


/// The only instance of the [StimAngular] pack.
StimAngular _angular;



// Provides global access to the "angular" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension StimAngularPackExtension on StimpackRoot {
  StimAngular get angular {
    if (_angular == null) {
      _angular = StimAngular.stimAngularInstance();
      _stimInitAngularPack();
    }
    return _angular;
  }
}
