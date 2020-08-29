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

  Name typeSetClassNameOf(StimMetaPack pack, StimMetaType type) {
    return ('stim' >> pack.name >> type.name >> 'set').pascal();
  }

  Name typeScopeClassNameOf(StimMetaPack pack, StimMetaType type) {
    return ('stim' >> pack.name >> type.name >> 'scope').pascal();
  }

  Name presetClassNameOf(
      StimMetaPack pack, StimMetaType type, StimMetaPreset preset) {
    return ('stim' >> pack.name >> type.name >> preset.name >> 'preset')
        .pascal();
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
