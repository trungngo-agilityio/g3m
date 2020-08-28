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

  Name typeClassNameOf(StimMetaPack pack, StimMetaType type) {
    return ('stim' >> pack.name >> type.name).pascal();
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
