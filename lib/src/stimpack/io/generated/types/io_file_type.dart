part of g3.stimpack.io.generated;



class StimIoFileType extends StimModelSymbol<StimIoFileType> {
  String path;

  StimIoFileTypeRef _ref;

  StimIoFileTypeRef get ref {
    return _ref ??= StimIoFileTypeRef();
  }
  StimIoFileType();
}


class StimIoFileTypeRef extends StimSymbolRef<StimIoFileType> implements StimIoFileType {

}


class StimIoFileTypeScope {
  StimIoFileType txt;

  StimIoFileType markdown;

  StimIoFileType yaml;

  StimIoFileType json;


  /// Creates a new "fileType" of [StimIoFileType] type.
  StimIoFileType of({dynamic name, String path, Set<StimModelTag> tags}) {
    return StimIoFileType()
        ..name = StimName.of(name)
        ..path = path
        ..tags = tags ?? {};
  }
}
