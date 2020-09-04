part of g3.stimpack.io.generated;



class StimIoFile extends StimModelSymbol<StimIoFile> {
  StimIoFileType type;

  StimIoFileRef _ref;

  StimIoFileRef get ref {
    return _ref ??= StimIoFileRef();
  }
  StimIoFile();
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
