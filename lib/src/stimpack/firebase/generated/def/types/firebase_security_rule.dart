part of g3.stimpack.firebase.generated;



class StimFirebaseSecurityRule extends StimModelSymbol<StimFirebaseSecurityRule> {
  Set<StimRbacCondition> createOne;

  Set<StimRbacCondition> updateOne;

  Set<StimRbacCondition> findOne;

  Set<StimRbacCondition> deleteOne;

  Set<StimRbacCondition> find;

  Set<StimRbacCondition> delete;

  Set<StimRbacCondition> read;

  Set<StimRbacCondition> write;

  Set<StimRbacCondition> readWrite;

  StimFirebaseSecurityRule();


  StimFirebaseSecurityRule ref() {
    return StimFirebaseSecurityRuleRef()..symbol = this;
  }

  /// Creates a new "securityRule" of [StimFirebaseSecurityRule] type.
  StimFirebaseSecurityRule refWith({dynamic name, Set<StimRbacCondition> createOne, Set<StimRbacCondition> updateOne, Set<StimRbacCondition> findOne, Set<StimRbacCondition> deleteOne, Set<StimRbacCondition> find, Set<StimRbacCondition> delete, Set<StimRbacCondition> read, Set<StimRbacCondition> write, Set<StimRbacCondition> readWrite, Set<StimModelTag> tags}) {
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

    if (read != null) {
      res.read = read;
    }

    if (write != null) {
      res.write = write;
    }

    if (readWrite != null) {
      res.readWrite = readWrite;
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
  StimFirebaseSecurityRule of({dynamic name, Set<StimRbacCondition> createOne, Set<StimRbacCondition> updateOne, Set<StimRbacCondition> findOne, Set<StimRbacCondition> deleteOne, Set<StimRbacCondition> find, Set<StimRbacCondition> delete, Set<StimRbacCondition> read, Set<StimRbacCondition> write, Set<StimRbacCondition> readWrite, Set<StimModelTag> tags}) {
    return StimFirebaseSecurityRule()
        ..name = StimName.of(name)
        ..createOne = createOne ?? {}
        ..updateOne = updateOne ?? {}
        ..findOne = findOne ?? {}
        ..deleteOne = deleteOne ?? {}
        ..find = find ?? {}
        ..delete = delete ?? {}
        ..read = read ?? {}
        ..write = write ?? {}
        ..readWrite = readWrite ?? {}
        ..tags = tags ?? {};
  }
}
