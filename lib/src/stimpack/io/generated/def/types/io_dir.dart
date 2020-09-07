part of g3.stimpack.io.generated;



class StimIoDir extends StimModelSymbol<StimIoDir> {
  String path;

  String absolutePath;

  Set<StimIoFile> files;

  Set<StimIoDir> dirs;

  StimIoDir();


  StimIoDir ref() {
    return StimIoDirRef()..symbol = this;
  }

  /// Creates a new "dir" of [StimIoDir] type.
  StimIoDir refWith({dynamic name, String path, String absolutePath, Set<StimIoFile> files, Set<StimIoDir> dirs, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (path != null) {
      res.path = path;
    }

    if (absolutePath != null) {
      res.absolutePath = absolutePath;
    }

    if (files != null) {
      res.files = files;
    }

    if (dirs != null) {
      res.dirs = dirs;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
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
