part of g3.stimpack.meta.techlab;

class StimGenMetaLib implements Node {
  final StimModelPackage pack;
  final Set<StimModelPackage> externalPackages;

  StimpackCodeConfig _config;

  StimGenMetaLib(this.pack, this.externalPackages);

  @override
  Node build(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();

    final fileName = _config.generatedLibFileNameOf(pack);

    // Generates a dart file that defines the entry point
    // for the whole pack.
    return DartCodeFile.of(
      fileName,
      package: _config.codeGeneratedPackageLibraryOf(pack),
      parts: _buildPartList(),
      afterPartSection: CodePlaceHolder.of(name: 'custom parts'),
      imports: _buildImportList(),
      afterImportSection: CodePlaceHolder.of(name: 'custom imports'),
    );
  }

  /// Builds the list of code imports.
  ///
  List<CodeImport> _buildImportList() {
    final imports = <CodeImport>[
      // imports the base stimpack
      CodeImport.of(path: 'package:g3m/stimpack_core.dart'),
      CodeImport.of(path: 'package:g3m/stimpack_meta.dart'),
      CodeImport.of(path: 'package:meta/meta.dart'),
      // Imports additional package refers by this package.
    ];

    if (externalPackages != null) {
      // Imports all external packs
      for (final externalPack in externalPackages) {
        imports.add(_config.codePackImportOf(externalPack));
      }
    }

    return imports;
  }

  /// Builds the list of parts to be included into this library dart file.
  /// These parts are generated via [StimGenMetaType], [StimGenMetaPreset],
  /// and [StimGenMetaTypeField].
  ///
  List<String> _buildPartList() {
    final parts = <String>[];
    parts.add(_config.packFileNameOf(pack).toString());
    parts.add(_config.packExtFileNameOf(pack).toString());

    for (final i in pack.types) {
      // Includes the type definition file
      parts.add('types/' + _config.typeFileNameOf(pack, i));
    }

    return parts;
  }
}
