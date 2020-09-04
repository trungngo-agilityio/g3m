part of g3.stimpack.rbac.generated;

class StimRbacOnStimModelType {
  StimModelType action;

  StimModelType resource;

  StimModelType group;

  StimModelType role;

  StimModelType policy;

  StimModelType policyKind;
}

extension StimRbacOnStimModelTypeExtension on StimModelTypeScope {
  StimRbacOnStimModelType get rbac {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return stimpack.rbac.onStimModelType;
  }
}
