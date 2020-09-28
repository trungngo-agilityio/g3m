part of g3.stimpack.firebase.init;

extension OnStimRbacSecurityRuleFirebaseExtension
    on StimFirebaseSecurityRuleScope {
  /// Creates a readonly security rule. This rule can be applied to any
  /// firebase resource. The [read] condition defines who can read
  /// the resource. This rule is quite strict and no one, even backend
  /// apis can make any write. This rule should be used to system protected
  /// resource like system config firestore data etc.
  ///
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

  /// Creates a read/write security rule with the given [read] and [write]
  /// conditions. This rule shall not allow any one and even the backend
  /// system to perform deletion on the target resource.
  ///
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

  /// Creates a read/write/delete resource with the specified [read], [write],
  /// and [delete] conditions. This is an easier to use version of
  /// [StimFirebaseSecurityRule.of] factory function.
  ///
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

  /// Creates a security rule that just give full access to a firebase
  /// resource if the specified [conditions] match. An example of
  /// such resource is firestore user's private data. Only user have
  /// full access to it and no one else.
  ///
  StimFirebaseSecurityRule fullAccessIf({
    @required dynamic name,
    @required Set<StimRbacCondition> conditions,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      tags: tags,
      findOne: conditions,
      find: conditions,
      createOne: conditions,
      updateOne: conditions,
      deleteOne: conditions,
      delete: conditions,
    );
  }
}
