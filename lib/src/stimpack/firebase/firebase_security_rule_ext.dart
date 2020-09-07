part of g3.stimpack.firebase.init;

extension StimFirebaseSecurityRuleExtension on StimFirebaseSecurityRuleScope {
  StimFirebaseSecurityRule readOnlyRuleOf({
    dynamic name,
    @required Set<StimRbacCondition> read,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      tags: tags,
      findOne: read,
      find: read,
      createOne: null,
      updateOne: null,
      deleteOne: null,
      delete: null,
    );
  }

  StimFirebaseSecurityRule readWriteOnlyIf({
    dynamic name,
    @required Set<StimRbacCondition> read,
    @required Set<StimRbacCondition> write,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      tags: tags,
      findOne: read,
      find: read,
      createOne: write,
      updateOne: write,
      deleteOne: null,
      delete: null,
    );
  }

  StimFirebaseSecurityRule readWriteDeleteIf({
    @required dynamic name,
    @required Set<StimRbacCondition> read,
    @required Set<StimRbacCondition> write,
    @required Set<StimRbacCondition> delete,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      tags: tags,
      findOne: read,
      find: read,
      createOne: write,
      updateOne: write,
      deleteOne: delete,
      delete: delete,
    );
  }

  StimFirebaseSecurityRule fullAccessIf({
    @required dynamic name,
    @required Set<StimRbacCondition> read,
    @required Set<StimRbacCondition> write,
    @required Set<StimRbacCondition> delete,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      tags: tags,
      findOne: read,
      find: read,
      createOne: write,
      updateOne: write,
      deleteOne: delete,
      delete: delete,
    );
  }
}
