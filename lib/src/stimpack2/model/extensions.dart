part of g3.stimpack2.model;


StimModel _model;

extension StimModelExtension on Stimpack {
  StimModel get model {
    return _model ??= StimModel();
  }
}


