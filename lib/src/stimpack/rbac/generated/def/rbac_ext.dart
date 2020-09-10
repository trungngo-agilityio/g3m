part of g3.stimpack.rbac.generated;



class StimRbacOnStimModelType {
  StimModelType action;

  StimModelType resource;

  StimModelType resourceKind;

  StimModelType group;

  StimModelType role;

  StimModelType policy;

  StimModelType policyKind;

  StimModelType condition;
}


class StimRbacOnStimModelField {
  StimModelField group;

  StimModelField groupSet;

  StimModelField policy;

  StimModelField policySet;

  StimModelField resource;

  StimModelField resourceSet;

  StimModelField role;

  StimModelField roleSet;

  StimModelField action;

  StimModelField actionSet;

  StimModelField condition;

  StimModelField conditionSet;
}



extension StimRbacOnStimModelTypeExtension on StimModelTypeScope {
  StimRbacOnStimModelType get rbac {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimRbac.stimRbacInstance().onStimModelType;
  }
}


extension StimRbacOnStimModelFieldExtension on StimModelFieldScope {
  StimRbacOnStimModelField get rbac {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimRbac.stimRbacInstance().onStimModelField;
  }
}
