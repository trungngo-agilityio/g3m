part of g3.stimpack.ngxs.init;


/// The only instance of the [StimNgxs] pack.
StimNgxs _ngxs;



// Provides global access to the "ngxs" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension OnStimPackNgxsExtension on StimpackRoot {
  StimNgxs get ngxs {
    if (_ngxs == null) {
      _ngxs = StimNgxs.stimNgxsInstance();
      _stimInitNgxsPack();
    }
    return _ngxs;
  }
}
