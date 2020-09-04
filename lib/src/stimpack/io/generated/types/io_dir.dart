part of g3.stimpack.io.generated;



class StimIoDir extends StimModelSymbol<StimIoDir> {
  String path;

  String absolutePath;

  Set<StimIoFile> files;

  Set<StimIoDir> dirs;

  StimIoDirRef _ref;

  StimIoDirRef get ref {
    return _ref ??= StimIoDirRef();
  }
  StimIoDir();
}


class StimIoDirRef extends StimSymbolRef<StimIoDir> implements StimIoDir {

}


class StimIoDirScope {
  /// Creates a new "dir" of [StimIoDir] type.
  StimIoDir of({dynamic name, String path, String absolutePath, Set<StimIoFile> files, Set<StimIoDir> dirs, Set<StimModelTag> tags}) {
    return StimIoDir()
        ..name = StimName.of(name)
        ..path = path
        ..absolutePath = absolutePath
        ..files = files ?? {}
        ..dirs = dirs ?? {}
        ..tags = tags ?? {};
  }
}
