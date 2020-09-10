part of g3.stimpack.firebase.generated;



class StimFirebaseSecurityRule extends StimModelSymbol<StimFirebaseSecurityRule> {
  Set<StimRbacCondition> createOne;

  Set<StimRbacCondition> updateOne;

  Set<StimRbacCondition> findOne;

  Set<StimRbacCondition> deleteOne;

  Set<StimRbacCondition> find;

  Set<StimRbacCondition> delete;

  StimFirebaseSecurityRule();


  StimFirebaseSecurityRule ref() {
    return StimFirebaseSecurityRuleRef()..symbol = this;
  }

  /// Creates a new "securityRule" of [StimFirebaseSecurityRule] type.
  StimFirebaseSecurityRule refWith({dynamic name, Set<StimRbacCondition> createOne, Set<StimRbacCondition> updateOne, Set<StimRbacCondition> findOne, Set<StimRbacCondition> deleteOne, Set<StimRbacCondition> find, Set<StimRbacCondition> delete, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (createOne != null) {
      res.createOne = createOne;
    }

    if (updateOne != null) {
      res.updateOne = updateOne;
    }

    if (findOne != null) {
      res.findOne = findOne;
    }

    if (deleteOne != null) {
      res.deleteOne = deleteOne;
    }

    if (find != null) {
      res.find = find;
    }

    if (delete != null) {
      res.delete = delete;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimFirebaseSecurityRuleRef extends StimSymbolRef<StimFirebaseSecurityRule> implements StimFirebaseSecurityRule {

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
