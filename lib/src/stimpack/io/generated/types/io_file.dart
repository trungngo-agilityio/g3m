part of g3.stimpack.io.generated;



class StimIoFile extends StimModelSymbol<StimIoFile> {
  StimIoFileType type;

  StimIoFile();


  StimIoFile ref() {
    return StimIoFileRef()..symbol = this;
  }

  /// Creates a new "file" of [StimIoFile] type.
  StimIoFile refWith({dynamic name, StimIoFileType type, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (type != null) {
      res.type = type;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimIoFileRef extends StimSymbolRef<StimIoFile> implements StimIoFile {

}


class StimIoFileScope {
  /// Creates a new "file" of [StimIoFile] type.
  StimIoFile of({dynamic name, StimIoFileType type, Set<StimModelTag> tags}) {
    return StimIoFile()
        ..name = StimName.of(name)
        ..type = type
        ..tags = tags ?? {};
  }
}
