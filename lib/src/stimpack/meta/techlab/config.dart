part of g3.stimpack.meta.techlab;

class StimpackCodeConfig extends ExactlyOneNode<StimpackCodeConfig> {
  StimpackCodeConfig(Node child) : super(child);

  String packFileNameOf(StimModelPackage pack) {
    var p = pack.name.snake();
    return '${p}_pack';
  }

  String packExtFileNameOf(StimModelPackage pack) {
    var p = pack.name.snake();
    return '${p}_ext';
  }

  String generatedLibFileNameOf(StimModelPackage pack) {
    var p = pack.name.snake();
    return '${p}';
  }

  String typeFileNameOf(
    StimModelPackage pack,
    StimModelType type,
  ) {
    final p = pack.name.snake();
    final t = type.name.snake().toString().removeIfStartsWith('stim_${p}_');
    return '${p}_${t}';
  }

  StimName libExtFileNameOf(StimModelPackage pack) {
    return (pack.name >> 'ext').snake();
  }

  StimName libFileNameOf(StimModelPackage pack) {
    return pack.name.snake();
  }

  StimName initPackFunctionNameOf(StimModelPackage pack) {
    return ('stim init' >> pack.name >> 'pack').camel();
  }

  // ===========================================================================
  // Pack
  // ===========================================================================

  StimName packClassNameOf(StimModelPackage pack) {
    return ('stim' >> pack.name).pascal();
  }

  StimName packExtensionClassNameOf(StimModelPackage pack) {
    return ('stim' >> pack.name >> 'pack extension').pascal();
  }

  StimName packInstanceFactoryNameOf(StimModelPackage pack) {
    return ('stim' >> pack.name >> 'instance').camel();
  }

  // ===========================================================================
  // Symbol
  // ===========================================================================

  /// Gets the abstract class name that inherits from [StimSymbol].
  /// For example if the [pack] is 'grpc' and the [type] is 'message' then
  /// the class name is 'StimGrpcMessage'.
  ///
  StimName symbolClassNameOf(StimModelType type) {
    return type.name.pascal();
  }

  StimName symbolRefClassNameOf(StimModelPackage pack, StimModelType type) {
    return (type.name >> 'ref').pascal();
  }

  // ===========================================================================
  // Scope
  // ===========================================================================

  StimName scopeClassNameOf(StimModelType type) {
    return (type.name >> 'scope').pascal();
  }

  // ===========================================================================
  // Meta
  // ===========================================================================

  StimName metaTypesClassNameOf(StimModelPackage package) {
    return ('stim' >> package.name >> 'type meta').pascal();
  }

  StimName metaTypesExtensionClassNameOf(StimModelPackage package) {
    return (metaTypesClassNameOf(package) >> 'extension').pascal();
  }

  // ===========================================================================
  // External type extension
  // ===========================================================================

  StimName valueExtClassName(StimModelPackage package, StimModelType type) {
    return ('stim' >> package.name >> 'on' >> type.name).pascal();
  }

  StimName valueExtFieldName(StimModelPackage package, StimModelType type) {
    return ('on' >> type.name).camel();
  }

  StimName valueExtExtensionName(StimModelPackage package, StimModelType type) {
    return ('stim' >> package.name >> 'on' >> type.name >> 'extension')
        .pascal();
  }

  // ===========================================================================
  // Code
  // ===========================================================================
  StimName fieldNameOfType(StimModelType type) {
    return fieldNameSimplified(type.package, type.name);
  }

  StimName fieldNameSimplified(StimModelPackage pack, StimName name) {
    return name.removeIfStartsWith('stim ${pack.name}').camel();
  }

  String publicTypeScopeOf(StimModelPackage pack, StimModelType type) {
    final typePack = type?.package ?? pack;
    return 'stimpack.${typePack.name.camel()}.${type.name.camel()}';
  }

  String publicMetaTypeName(StimModelPackage pack, StimModelType type,
      {prefix = 'stimpack.model.type'}) {
    final typePack = type?.package ?? pack;
    final presetName = typePack.name.camel();
    return '${prefix}.${presetName}.${type.name.camel()}';
  }

  CodePackage codeGeneratedPackageLibraryOf(StimModelPackage pack,
      {bool isPart}) {
    final path = ['g3', 'stimpack', pack.name.snake()];
    final name = 'generated';

    if (isPart == true) {
      return CodePackage.partOf(name, path: path);
    } else {
      return CodePackage.of(name, path: path);
    }
  }

  CodePackage codeInitPackageLibraryOf(StimModelPackage pack, {bool isPart}) {
    final path = ['g3', 'stimpack', pack.name.snake()];
    final name = 'init';

    if (isPart == true) {
      return CodePackage.partOf(name, path: path);
    } else {
      return CodePackage.of(name, path: path);
    }
  }

  CodeImport codePackImportOf(StimModelPackage pack) {
    if (pack.isDart) {
      final uri = pack.dartLibrary.uri;
      // Imports the dart package.
      return CodeImport.of(path: uri.toString());
    } else {
      return CodeImport.of(
          path: 'package:g3m/stimpack_${pack.name.camel()}.dart');
    }
  }

  CodeFunctionCall getPackInstance(StimModelPackage pack) {
    /// The pack class className.
    return CodeFunctionCall.of(
      instance: packClassNameOf(pack),
      name: packInstanceFactoryNameOf(pack),
    );
  }

  @override
  Node buildOne(BuildContext context, Node child) {
    return DartCodeConfig(child);
  }
}
