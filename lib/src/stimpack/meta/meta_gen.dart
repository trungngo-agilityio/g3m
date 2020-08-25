import 'package:g3m/src/stimpack/meta/techlab/lib.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/techlab_core.dart';

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
