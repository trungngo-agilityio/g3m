part of g3.stimpack.io.generated;



class StimIoFileType extends StimModelSymbol<StimIoFileType> {
  String path;

  StimIoFileType();


  StimIoFileType ref() {
    return StimIoFileTypeRef()..symbol = this;
  }

  /// Creates a new "fileType" of [StimIoFileType] type.
  StimIoFileType refWith({dynamic name, String path, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (path != null) {
      res.path = path;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
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
