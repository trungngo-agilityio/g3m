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

  Name packClassNameOf(StimMetaPack pack) {
    return ('stim' >> pack.name >> pack.name).pascal();
  }

  Name packImplClassNameOf(StimMetaPack pack) {
    return ('_stim' >> pack.name >> pack.name >> 'impl').pascal();
  }

  Name _implClassNameOf(Name clazzName) {
    return ('_' >> clazzName >> 'impl').pascal();
  }

  /// Gets the class name that defines a type. For example
  /// if the [pack] is 'grpc' and the [type] is 'message' then
  /// the class name is 'StimGrpcMessage'.
  ///
  Name typeClassNameOf(StimMetaPack pack, StimMetaType type) {
    final typePack = type.pack ?? pack;
    assert(typePack != null);
    assert(type.name?.isNotEmpty == true);
    return ('stim' >> typePack.name >> type.name).pascal();
  }

  Name typeImplClassNameOf(StimMetaPack pack, StimMetaType type) {
    return _implClassNameOf(typeClassNameOf(pack, type));
  }

  Name typeSetClassNameOf(StimMetaPack pack, StimMetaType type) {
    return ('stim' >> pack.name >> type.name >> 'set').pascal();
  }

  Name typeScopeClassNameOf(StimMetaPack pack, StimMetaType type) {
    return ('stim' >> pack.name >> type.name >> 'scope').pascal();
  }

  Name typeScopeImplClassNameOf(StimMetaPack pack, StimMetaType type) {
    return _implClassNameOf(typeScopeClassNameOf(pack, type));
  }

  Name presetClassNameOf(
      StimMetaPack pack, StimMetaType type, StimMetaPreset preset) {
    return ('stim' >> pack.name >> type.name >> preset.name >> 'preset')
        .pascal();
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
}
