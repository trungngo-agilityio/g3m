part of g3.stimpack.rest.init;


/// The only instance of the [StimRest] pack.
StimRest _rest;



// Provides global access to the "rest" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension StimRestPackExtension on StimpackRoot {
  StimRest get rest {
    if (_rest == null) {
      _rest = StimRest.stimRestInstance();
      _stimInitRestPack();
    }
    return _rest;
  }
}
