part of g3.stimpack.nx.init;


/// The only instance of the [StimNx] pack.
StimNx _nx;



// Provides global access to the "nx" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension OnStimPackNxExtension on StimpackRoot {
  StimNx get nx {
    if (_nx == null) {
      _nx = StimNx.stimNxInstance();
      _stimInitNxPack();
    }
    return _nx;
  }
}
