part of g3.stimpack.firebase.init;

/// This function is called during the initialization of firebase
void _stimInitFirebasePack() {
  _resourceKinds();
  _resources();
}

void _resourceKinds() {
  final k = stimpack.rbac.resourceKind, fk = k.firebase;
  fk.firebase = k.of(name: 'firebase');
  fk.firestore = k.of(name: 'firestore');
  fk.storage = k.of(name: 'storage');
  fk.function = k.of(name: 'function');
  fk.hosting = k.of(name: 'hosting');
}

void _resources() {
  final r = stimpack.rbac.resource, fr = r.firebase;
  final k = stimpack.rbac.resourceKind, fk = k.firebase;

  fr.firebaseService = r.rootResourceOf(name: 'firebase', kind: fk.firebase);
  fr.firestoreService =
      r.of(name: 'firestore', kind: fk.firestore, parent: fr.firebaseService);
  fr.storageService =
      r.of(name: 'storage', kind: fk.storage, parent: fr.firebaseService);
  fr.functionService =
      r.of(name: 'function', kind: fk.function, parent: fr.firebaseService);
  fr.hostingService =
      r.of(name: 'hosting', kind: fk.hosting, parent: fr.firebaseService);
}
