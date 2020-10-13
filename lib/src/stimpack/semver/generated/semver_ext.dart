part of g3.stimpack.semver.init;


/// The only instance of the [StimSemver] pack.
StimSemver _semver;



// Provides global access to the "semver" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension OnStimPackSemverExtension on StimpackRoot {
  StimSemver get semver {
    if (_semver == null) {
      _semver = StimSemver.stimSemverInstance();
      _stimInitSemverPack();
    }
    return _semver;
  }
}
