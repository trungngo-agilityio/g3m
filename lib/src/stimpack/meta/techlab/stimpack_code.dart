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

  @override
  Node buildOne(BuildContext context, Node child) {
    return DartCodeConfig(
      CodeTypeNameMapperConfig.forGRpcTypeToDartLike(
        child,
      ),
    );
  }
}
