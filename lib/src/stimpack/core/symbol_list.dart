part of g3.stimpack.core;

/// Notes that cannot implement +/- operators for List
/// because it already has it.
extension StimListExtension<T> on List<T> {
  List<T> clone() {
    return List<T>.of(this);
  }
}
