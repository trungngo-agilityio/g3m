part of g3.stimpack.base;

Stimpack _stimpack;

Stimpack get stimpack {
  return _stimpack ??= Stimpack._();
}

class Stimpack {
  Stimpack._();
}
