part of g3.stimpack.meta;


void stimpackGen(StimMetaPack meta, String dir) {
  print('pack: ${meta.name}');

  for (final i in meta.types) {
    print(' - type: ${i.name}');

    for (final j in i.fields) {
      print('     - ${j.name}, kind: ${j.kind.name}, type: ${j.type.name}');
    }
  }

  Node program = SingleChildNode(
    Directory.relative(
      dir,
      StimpackCodeConfig(StimGenMeta(meta)),
    ),
  );

  Program.execute(program);
}
