part of g3.stimpack.firebase.init;

extension StimFirebaseFirestoreExtension on StimFirebaseFirestoreScope {
  StimFirebaseFirestore instanceOf(
      {@required dynamic name, Set<StimModelTag> tags}) {
    final res = of(
      name: name,
      tags: tags,
      resource: null,
    );

    final r = stimpack.rbac.resource;
    res.resource = r.of(
      name: StimName.refOf(res) >> 'firestore',
      parent: r.firebase.firestore,
    );

    return res;
  }
}
