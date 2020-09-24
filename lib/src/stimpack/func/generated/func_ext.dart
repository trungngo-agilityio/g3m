part of g3.stimpack.func.init;


/// The only instance of the [StimFunc] pack.
StimFunc _func;



// Provides global access to the "func" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension OnStimPackFuncExtension on StimpackRoot {
  StimFunc get func {
    if (_func == null) {
      _func = StimFunc.stimFuncInstance();
      _stimInitFuncPack();
    }
    return _func;
  }
}
