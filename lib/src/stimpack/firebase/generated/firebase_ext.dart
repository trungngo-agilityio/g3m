part of g3.stimpack.firebase.init;


/// The only instance of the [StimFirebase] pack.
StimFirebase _firebase;



// Provides global access to the "firebase" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension StimFirebasePackExtension on StimpackRoot {
  StimFirebase get firebase {
    if (_firebase == null) {
      _firebase = StimFirebase.stimFirebaseInstance();
      _stimInitFirebasePack();
    }
    return _firebase;
  }
}
