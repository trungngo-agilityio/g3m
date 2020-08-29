part of g3.stimpack.meta.techlab;

class StimpackCodeConfig extends ExactlyOneNode<StimpackCodeConfig> {
  StimpackCodeConfig(Node child) : super(child);

  String packFileNameOf(StimMetaPack pack) {
    var p = pack.name.snake();
    return '${p}';
  }

  String typeFileNameOf(
    StimMetaPack pack,
    StimMetaType type,
  ) {
    final p = pack.name.snake();
    final t = type.name.snake();
    return '${p}_${t}';
  }

  String presetFileNameOf(
    StimMetaPack pack,
  ) {
    final packName = pack.name.snake();
    return '${packName}_presets';
  }

  String typeFieldFileNameOf(
    StimMetaPack pack,
    StimMetaType type,
    StimMetaField field,
  ) {
    final p = pack.name.snake();
    final t = type.name.snake();
    final f = field.name.snake();
    return '${p}_${t}__${f}';
  }

  // ===========================================================================
  // Pack
  // ===========================================================================

  Name packClassNameOf(StimMetaPack pack) {
    return ('stim' >> pack.name >> pack.name).pascal();
  }

  Name packImplClassNameOf(StimMetaPack pack) {
    return ('_stim' >> pack.name >> pack.name >> 'impl').pascal();
  }

  // ===========================================================================
  // Symbol
  // ===========================================================================

  /// Gets the abstract class name that inherits from [StimSymbol].
  /// For example if the [pack] is 'grpc' and the [type] is 'message' then
  /// the class name is 'StimGrpcMessage'.
  ///
  Name symbolClassNameOf(StimMetaPack pack, StimMetaType type) {
    final typePack = type.pack ?? pack;
    return ('stim' >> typePack.name >> type.name).pascal();
  }

  /// Gets a class name that implements the abstract class named by
  /// [symbolClassNameOf]. For example, if the [pack] is 'grpc' and the
  /// [type] is 'message' then the class name is '_StimGrpcMessageImpl'
  ///
  Name symbolImplClassNameOf(StimMetaPack pack, StimMetaType type) {
    return _implClassNameOf(symbolClassNameOf(pack, type));
  }

  // ===========================================================================
  // Symbol Set
  // ===========================================================================

  /// Gets an abstract class name that inherits from [StimSymbolSet].
  /// For example if the [pack] is 'grpc' and the [type] is 'message' then
  /// the class name is 'StimGrpcMessageSet'.
  ///
  Name symbolSetClassNameOf(StimMetaPack pack, StimMetaType type) {
    final typePack = type.pack ?? pack;
    return ('stim' >> typePack.name >> type.name >> 'set').pascal();
  }

  // ===========================================================================
  // Field
  // ===========================================================================
  Name fieldSymbolOrSetNameOf(StimMetaPack pack, StimMetaField field) {
    return field.isSet
        ? symbolSetClassNameOf(pack, field.type)
        : symbolClassNameOf(pack, field.type);
  }

  Name fieldOpOrSetOpNameOf(
      StimMetaPack pack, StimMetaType type, StimMetaField field) {
    return field.isSet
        ? setOpClassNameOf(pack, type, field)
        : opClassNameOf(pack, type, field);
  }

  // ===========================================================================
  // Scope
  // ===========================================================================

  /// Gets an abstract class name that inherits from [StimScope].
  /// For example if the [pack] is 'grpc' and the [type] is 'message' then
  /// the class name is 'StimGrpcMessageScope'.
  ///
  Name scopeClassNameOf(StimMetaPack pack, StimMetaType type) {
    final typePack = type.pack ?? pack;
    return ('stim' >> typePack.name >> type.name >> 'scope').pascal();
  }

  Name scopeImplClassNameOf(StimMetaPack pack, StimMetaType type) {
    return _implClassNameOf(scopeClassNameOf(pack, type));
  }

  // ===========================================================================
  // Op
  // ===========================================================================

  /// Gets an abstract class name that inherits from [StimSymbolOp].
  /// For example if the [pack] is 'grpc', the [type] is 'message', and [field]
  /// is 'rule' then
  /// the class name is 'StimGrpcMessageXRuleOp'.
  ///
  Name opClassNameOf(
      StimMetaPack pack, StimMetaType type, StimMetaField field) {
    final typePack = type.pack ?? pack;
    return ('stim' >> typePack.name >> type.name >> 'x' >> field.name >> 'op')
        .pascal();
  }

  Name opImplClassNameOf(
      StimMetaPack pack, StimMetaType type, StimMetaField field) {
    return _implClassNameOf(opClassNameOf(pack, type, field));
  }

  // ===========================================================================
  // Set Op
  // ===========================================================================

  /// Gets an abstract class name that inherits from [StimSymbolSetOp].
  /// For example if the [pack] is 'grpc', the [type] is 'message', and [field]
  /// is 'rule' then
  /// the class name is 'StimGrpcMessageXRuleSetOp'.
  Name setOpClassNameOf(
      StimMetaPack pack, StimMetaType type, StimMetaField field) {
    final typePack = type.pack ?? pack;
    return ('stim' >>
            typePack.name >>
            type.name >>
            'x' >>
            field.name >>
            'set op')
        .pascal();
  }

  Name setOpImplClassNameOf(
      StimMetaPack pack, StimMetaType type, StimMetaField field) {
    return _implClassNameOf(setOpClassNameOf(pack, type, field));
  }

  // ===========================================================================
  // Preset
  // ===========================================================================

  Name presetClassNameOf(
      StimMetaPack pack, StimMetaType type, StimMetaPreset preset) {
    final typePack = type.pack ?? pack;
    var name = preset.name;
    if (name?.isNotEmpty != true) {
      name = Name('default');
    }

    return ('stim' >> typePack.name >> type.name >> name >> 'preset').pascal();
  }

  // ===========================================================================
  // Code
  // ===========================================================================

  String publicTypeScopeOf(StimMetaPack pack, StimMetaType type) {
    final fieldTypePack = type.pack ?? pack;
    return 'stimpack.${fieldTypePack.name.camel()}.${type.name.camel()}';
  }

  String publicMetaTypeName(StimMetaPack pack, StimMetaType type) {
    final fieldTypePack = type.pack ?? pack;
    final presetName = ('for' >> fieldTypePack.name).camel();
    return 'stimpack.meta.type.${presetName}.${type.name.camel()}';
  }

  CodePackage codePackageLibraryOf(StimMetaPack pack, {bool isPart}) {
    final path = ['g3', 'stimpack', pack.name];
    final name = 'generated';
    if (isPart == true) {
      return CodePackage.partOf(name, path: path);
    } else {
      return CodePackage.of(name, path: path);
    }
  }

  CodeImport codePackImportOf(StimMetaPack pack) {
    return CodeImport.of(
        path: 'package:g3m/stimpack_${pack.name.camel()}.dart');
  }

  @override
  Node buildOne(BuildContext context, Node child) {
    return DartCodeConfig(
      CodeTypeNameMapperConfig.forGRpcTypeToDartLike(
        child,
      ),
    );
  }

  Name _implClassNameOf(Name clazzName) {
    return ('_' >> clazzName >> 'impl').pascal();
  }
}
