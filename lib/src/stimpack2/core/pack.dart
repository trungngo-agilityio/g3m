part of g3.stimpack2.core;

final StimpackRoot stimpack = StimpackRoot();

class StimPack {
  final String name;

  StimPack(this.name) {}

  void _init(Type type) {
    final tm = reflectType(type);
  }
}

class StimpackRoot extends StimPack {
  StimpackRoot() : super('core');
}
