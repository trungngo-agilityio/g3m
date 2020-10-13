part of g3.stimpack.io.init;

const _ioPackageSourceTagName = 'io:packageSource';

extension OnStimModelPackageRepoExtension on StimModelPackage {
  StimIoFile get sourceFile =>
      firstValueOfTag<StimIoFile>(_ioPackageSourceTagName) ??
      parent?.sourceFile;

  set sourceFile(StimIoFile file) {
    if (file == null) {
      removeAllTags(_ioPackageSourceTagName);
    } else {
      setTag(name: _ioPackageSourceTagName, value: file);
    }
  }
}
