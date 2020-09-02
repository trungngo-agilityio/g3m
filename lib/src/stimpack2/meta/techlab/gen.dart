part of g3.stimpack2.meta.techlab;

class StimGenMeta implements Node {
  final StimModelPackage pack;

  StimGenMeta(this.pack);

  @override
  Node build(BuildContext context) {
    return Container([
      Directory.relative(
        'generated',
        Container([
          StimGenMetaPack(pack),
          _buildTypeFiles(),
        ]),
      ),
      StimGenMetaInit(pack),
    ]);
  }

  Node _buildTypeFiles() {
    return Container(pack.types.map((e) => StimGenMetaType(pack, e)).toList());
  }
}

void stimpackGen(StimModelPackage meta, String dir) {
  Node program = SingleChildNode(
    Directory.relative(
      dir,
      StimpackCodeConfig(StimGenMeta(meta)),
    ),
  );

  Program.execute(program);
}
