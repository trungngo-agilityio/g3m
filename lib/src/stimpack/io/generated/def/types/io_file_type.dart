part of g3.stimpack.io.generated;



class StimIoFileType extends StimModelSymbol<StimIoFileType> {
  String path;

  StimIoFileType();


  /// Creates a new "fileType" of [StimIoFileType] type.
  StimIoFileType copyWith({@required
  dynamic name, String path, Set<StimModelTag> tags}) {
    return StimIoFileType()
        ..name = StimName.of(name ?? this.name)
        ..path = path ?? this.path
        ..tags = tags ?? this.tags;
  }
}


class StimIoFileTypeScope {
  StimIoFileType txt;

  StimIoFileType markdown;

  StimIoFileType yaml;

  StimIoFileType json;


  /// Creates a new "fileType" of [StimIoFileType] type.
  StimIoFileType of({@required
  dynamic name, String path, Set<StimModelTag> tags}) {
    return StimIoFileType()
        ..name = StimName.of(name)
        ..path = path
        ..tags = tags ?? {};
  }
}
