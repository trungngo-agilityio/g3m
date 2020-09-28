part of g3.stimpack.io.generated;



class StimIoFile extends StimModelSymbol<StimIoFile> {
  StimIoFileType type;

  StimIoFile();


  /// Creates a new "file" of [StimIoFile] type.
  StimIoFile copyWith({@required
  dynamic name, StimIoFileType type, Set<StimModelTag> tags}) {
    return StimIoFile()
        ..name = StimName.of(name ?? this.name)
        ..type = type ?? this.type
        ..tags = tags ?? this.tags;
  }
}


class StimIoFileScope {
  /// Creates a new "file" of [StimIoFile] type.
  StimIoFile of({@required
  dynamic name, StimIoFileType type, Set<StimModelTag> tags}) {
    return StimIoFile()
        ..name = StimName.of(name)
        ..type = type
        ..tags = tags ?? {};
  }
}
