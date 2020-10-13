part of g3.stimpack.nx.init;

extension OnAppNxExtension on StimNxApp {
  StimIoDir get path => repo?.path;

  bool get exists => path?.exists;
}
