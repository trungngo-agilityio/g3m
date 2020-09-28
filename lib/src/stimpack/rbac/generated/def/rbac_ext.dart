part of g3.stimpack.rbac.generated;



class OnStimModelTypeForRbac {
  StimModelType action;

  StimModelType resource;

  StimModelType resourceKind;

  StimModelType group;

  StimModelType role;

  StimModelType policy;

  StimModelType policyKind;

  StimModelType condition;
}


class OnStimModelFieldForRbac {
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



extension OnStimModelTypeForRbacExtension on StimModelTypeScope {
  OnStimModelTypeForRbac get rbac {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimRbac.stimRbacInstance().onStimModelType;
  }
}


extension OnStimModelFieldForRbacExtension on StimModelFieldScope {
  OnStimModelFieldForRbac get rbac {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimRbac.stimRbacInstance().onStimModelField;
  }
}
