part of g3.stimpack.model;

StimModel _model;

extension StimModelExtension on StimpackRoot {
  StimModel get model {
    return _model ??= StimModel();
  }
}
