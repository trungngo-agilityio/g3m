part of g3.stimpack.io.generated;



class StimIoDir extends StimModelSymbol<StimIoDir> {
  /// The dir path. It is an absolute path if the [parent] is not set.
  String path;

  /// The parent directory of this one.
  StimIoDir parent;

  /// The set of files in this directories.
  Set<StimIoFile> files;

  /// The set of sub directories of this one.
  Set<StimIoDir> dirs;

  StimIoDir();


  /// Creates a new "dir" of [StimIoDir] type.
  StimIoDir copyWith({@required
  dynamic name, String path, StimIoDir parent, Set<StimIoFile> files, Set<StimIoDir> dirs, Set<StimModelTag> tags}) {
    return StimIoDir()
        ..name = StimName.of(name ?? this.name)
        ..path = path ?? this.path
        ..parent = parent ?? this.parent
        ..files = files ?? this.files
        ..dirs = dirs ?? this.dirs
        ..tags = tags ?? this.tags;
  }
}


class StimIoDirScope {
  /// Creates a new "dir" of [StimIoDir] type.
  StimIoDir of({@required
  dynamic name, String path, StimIoDir parent, Set<StimIoFile> files, Set<StimIoDir> dirs, Set<StimModelTag> tags}) {
    return StimIoDir()
        ..name = StimName.of(name)
        ..path = path
        ..parent = parent
        ..files = files ?? {}
        ..dirs = dirs ?? {}
        ..tags = tags ?? {};
  }
}
