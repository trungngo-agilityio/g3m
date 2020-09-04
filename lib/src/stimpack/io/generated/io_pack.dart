part of g3.stimpack.io.generated;

/// The only instance of the [StimIo] pack.
StimIo _io;

class StimIo extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "file" symbols,
  /// typed of [StimIoFile]."
  final StimIoFileScope file;

  /// Scope class for constructing all "fileType" symbols,
  /// typed of [StimIoFileType]."
  final StimIoFileTypeScope fileType;

  /// Scope class for constructing all "dir" symbols,
  /// typed of [StimIoDir]."
  final StimIoDirScope dir;

  final StimIoOnStimModelType onStimModelType;

  StimIo(StimModel model)
      : file = StimIoFileScope(),
        fileType = StimIoFileTypeScope(),
        dir = StimIoDirScope(),
        onStimModelType = StimIoOnStimModelType(),
        super('io') {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();

    /// Call custom pack initialization code, this code is
    /// not overwritten during pack re-generation.
    stimInitIoPack(this);
  }

  void _buildMeta() {
    final m = stimpack.model, f = m.field, t = m.type;
    final mp = _metaPackage = m.package.of(name: 'io');
    final mt = onStimModelType;

    /// Builds type "file"
    mt.file = t.symbolOf(name: 'file', package: mp);

    /// Builds type "fileType"
    mt.fileType = t.symbolOf(name: 'fileType', package: mp);

    /// Builds type "dir"
    mt.dir = t.symbolOf(name: 'dir', package: mp);

    /// Builds fields for type "file"
    mt.file.fields = {
      /// field "file"
      f.of(name: 'type', type: mt.fileType)
    };

    /// Builds fields for type "fileType"
    mt.fileType.fields = {
      /// field "fileType"
      f.of(name: 'path', type: t.string)
    };

    /// Builds fields for type "dir"
    mt.dir.fields = {
      /// field "dir"
      f.of(name: 'path', type: t.string),

      /// field "dir"
      f.of(name: 'absolute path', type: t.string),

      /// field "dir"
      f.of(name: 'files', type: t.setOf(item: mt.file)),

      /// field "dir"
      f.of(name: 'dirs', type: t.setOf(item: mt.dir))
    };
  }
}

// Provides global access to the "io" pack. Only one instance of the pack
// is created. During the creation, other packs that this pack depends on might
// be created as well.
//
extension StimIoPackExtension on StimpackRoot {
  StimIo get io {
    return _io ??= StimIo(stimpack.model);
  }
}
