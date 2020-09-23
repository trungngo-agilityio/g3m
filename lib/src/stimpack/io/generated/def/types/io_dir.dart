part of g3.stimpack.io.generated;



class StimIoDir extends StimModelSymbol<StimIoDir> {
  String path;

  String absolutePath;

  Set<StimIoFile> files;

  Set<StimIoDir> dirs;

  StimIoDir();


  /// Creates a new "dir" of [StimIoDir] type.
  StimIoDir copyWith({@required
  dynamic name, String path, String absolutePath, Set<StimIoFile> files, Set<StimIoDir> dirs, Set<StimModelTag> tags}) {
    return StimIoDir()
        ..name = StimName.of(name ?? this.name)
        ..path = path ?? this.path
        ..absolutePath = absolutePath ?? this.absolutePath
        ..files = files ?? this.files
        ..dirs = dirs ?? this.dirs
        ..tags = tags ?? this.tags;
  }
}


class StimIoDirScope {
  /// Creates a new "dir" of [StimIoDir] type.
  StimIoDir of({@required
  dynamic name, String path, String absolutePath, Set<StimIoFile> files, Set<StimIoDir> dirs, Set<StimModelTag> tags}) {
    return StimIoDir()
        ..name = StimName.of(name)
        ..path = path
        ..absolutePath = absolutePath
        ..files = files ?? {}
        ..dirs = dirs ?? {}
        ..tags = tags ?? {};
  }
}
