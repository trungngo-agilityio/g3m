part of g3.stimpack.meta.techlab;

class StimGenMeta implements Node {
  final StimMetaPack pack;

  StimGenMeta(this.pack);

  @override
  Node build(BuildContext context) {
    return Container([
      _buildPackFile(),
      _buildTypeFiles(),
      _buildTypeFieldFiles(),
    ]);
  }

  Node _buildPackFile() {
    return StimGenMetaPack(pack);
  }

  Node _buildTypeFiles() {
    return Container(pack.types.map((e) => StimGenMetaType(pack, e)).toList());
  }

  Node _buildTypeFieldFiles() {
    final files = <Node>[];
    for (final i in pack.types) {
      for (final j in i.fields) {
        files.add(StimGenMetaTypeField(pack, i, j));
      }
    }

    return Container(files);
  }
}