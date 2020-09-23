part of g3.stimpack.firebase.generated;



class StimFirebaseSecurityRule extends StimModelSymbol<StimFirebaseSecurityRule> {
  Set<StimRbacCondition> createOne;

  Set<StimRbacCondition> updateOne;

  Set<StimRbacCondition> findOne;

  Set<StimRbacCondition> deleteOne;

  Set<StimRbacCondition> find;

  Set<StimRbacCondition> delete;

  StimFirebaseSecurityRule();


  /// Creates a new "securityRule" of [StimFirebaseSecurityRule] type.
  StimFirebaseSecurityRule copyWith({@required
  dynamic name, @required
  Set<StimRbacCondition> createOne, @required
  Set<StimRbacCondition> updateOne, @required
  Set<StimRbacCondition> findOne, @required
  Set<StimRbacCondition> deleteOne, @required
  Set<StimRbacCondition> find, @required
  Set<StimRbacCondition> delete, Set<StimModelTag> tags}) {
    return StimFirebaseSecurityRule()
        ..name = StimName.of(name ?? this.name)
        ..createOne = createOne ?? this.createOne
        ..updateOne = updateOne ?? this.updateOne
        ..findOne = findOne ?? this.findOne
        ..deleteOne = deleteOne ?? this.deleteOne
        ..find = find ?? this.find
        ..delete = delete ?? this.delete
        ..tags = tags ?? this.tags;
  }
}


class StimFirebaseSecurityRuleScope {
  /// Creates a new "securityRule" of [StimFirebaseSecurityRule] type.
  StimFirebaseSecurityRule of({@required
  dynamic name, @required
  Set<StimRbacCondition> createOne, @required
  Set<StimRbacCondition> updateOne, @required
  Set<StimRbacCondition> findOne, @required
  Set<StimRbacCondition> deleteOne, @required
  Set<StimRbacCondition> find, @required
  Set<StimRbacCondition> delete, Set<StimModelTag> tags}) {
    return StimFirebaseSecurityRule()
        ..name = StimName.of(name)
        ..createOne = createOne ?? {}
        ..updateOne = updateOne ?? {}
        ..findOne = findOne ?? {}
        ..deleteOne = deleteOne ?? {}
        ..find = find ?? {}
        ..delete = delete ?? {}
        ..tags = tags ?? {};
  }
}
