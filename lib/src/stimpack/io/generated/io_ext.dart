part of g3.stimpack.io.init;


/// The only instance of the [StimIo] pack.
StimIo _io;



// Provides global access to the "io" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension OnStimPackIoExtension on StimpackRoot {
  StimIo get io {
    if (_io == null) {
      _io = StimIo.stimIoInstance();
      _stimInitIoPack();
    }
    return _io;
  }
}
