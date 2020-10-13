part of g3.stimpack.nx.init;

extension OnLibNxExtension on StimNxLib {
  StimIoDir get path => repo?.path;

  bool get exists => path?.exists;
}
