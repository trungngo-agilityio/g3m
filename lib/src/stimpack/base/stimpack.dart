part of g3.stimpack.base;

Stimpack _stimpack;

/// Gets the global stimpack. Includes additional stimpack packages
/// to get more data.
///
Stimpack get stimpack {
  return _stimpack ??= Stimpack._();
}

/// Just a place holder class for all packages to add their
/// owns extension to.
class Stimpack {
  Stimpack._();
}
