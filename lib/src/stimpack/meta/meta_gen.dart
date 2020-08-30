part of g3.stimpack.meta;

void stimpackGen(StimMetaPack meta, String dir) {
  Node program = SingleChildNode(
    Directory.relative(
      dir,
      StimpackCodeConfig(StimGenMeta(meta)),
    ),
  );

  Program.execute(program);
}
