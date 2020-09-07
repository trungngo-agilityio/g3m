part of g3.stimpack.firebase.init;

/// This function is called during the initialization of firebase
void _stimInitFirebasePack() {
  /// init firebase here
  _resources();
}

void _resources() {
  final r = stimpack.rbac.resource, mr = r.firebase;
  mr.firestore = r.managedResourceOf(id: 'firestore');
}
