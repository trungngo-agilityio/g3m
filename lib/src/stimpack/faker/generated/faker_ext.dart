part of g3.stimpack.faker.init;


/// The only instance of the [StimFaker] pack.
StimFaker _faker;



// Provides global access to the "faker" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension OnStimPackFakerExtension on StimpackRoot {
  StimFaker get faker {
    if (_faker == null) {
      _faker = StimFaker.stimFakerInstance();
      _stimInitFakerPack();
    }
    return _faker;
  }
}
