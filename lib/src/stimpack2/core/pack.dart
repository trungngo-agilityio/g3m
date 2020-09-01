part of g3.stimpack2.core;

final Stimpack stimpack = Stimpack();

class StimPack {
  final String name;

  StimPack(this.name) {}

  void _init(Type type) {
    final tm = reflectType(type);
  }
}

class Stimpack extends StimPack {
  Stimpack() : super('core');
}
