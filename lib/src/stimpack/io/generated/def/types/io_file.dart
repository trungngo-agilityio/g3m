part of g3.stimpack.io.generated;



class StimIoFile extends StimModelSymbol<StimIoFile> {
  /// The directory that this file is in
  StimIoDir dir;

  /// The file type
  StimIoFileType type;

  StimIoFile();


  /// Creates a new "file" of [StimIoFile] type.
  StimIoFile copyWith({@required
  dynamic name, StimIoDir dir, StimIoFileType type, Set<StimModelTag> tags}) {
    return StimIoFile()
        ..name = StimName.of(name ?? this.name)
        ..dir = dir ?? this.dir
        ..type = type ?? this.type
        ..tags = tags ?? this.tags;
  }
}


class StimIoFileScope {
  /// Creates a new "file" of [StimIoFile] type.
  StimIoFile of({@required
  dynamic name, StimIoDir dir, StimIoFileType type, Set<StimModelTag> tags}) {
    return StimIoFile()
        ..name = StimName.of(name)
        ..dir = dir
        ..type = type
        ..tags = tags ?? {};
  }
}
