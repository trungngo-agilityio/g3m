part of g3.stimpack.repo.init;


/// The only instance of the [StimRepo] pack.
StimRepo _repo;



// Provides global access to the "repo" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension OnStimPackRepoExtension on StimpackRoot {
  StimRepo get repo {
    if (_repo == null) {
      _repo = StimRepo.stimRepoInstance();
      _stimInitRepoPack();
    }
    return _repo;
  }
}
