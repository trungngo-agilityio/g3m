part of g3.stimpack.model;

StimModel _model;

extension StimModelExtension on StimpackRoot {
  StimModel get model {
    return _model ??= StimModel();
  }
}

extension StimModelOnSet<T extends StimNamed> on Set<T> {
  Set<T> whereNameIs(dynamic name) {
    name = StimName.of(name);
    return where((element) => element.name == name).toSet();
  }

  T firstWhereNameIs(dynamic name) {
    name = StimName.of(name);
    return firstWhere((element) => element.name == name, orElse: () => null);
  }
}
