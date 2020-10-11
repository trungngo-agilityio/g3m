part of g3.stimpack.io.init;

const _ioTypeSourceTagName = 'io:typeSource';

extension OnStimModelTypeRepoExtension on StimModelType {
  StimIoFile get sourceFile =>
      firstValueOfTag<StimIoFile>(_ioTypeSourceTagName) ?? package?.sourceFile;

  set sourceFile(StimIoFile file) {
    if (file == null) {
      removeAllTags(_ioTypeSourceTagName);
    } else {
      setTag(name: _ioTypeSourceTagName, value: file);
    }
  }
}
