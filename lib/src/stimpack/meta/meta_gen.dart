import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

void main() {
  final meta = stimpack.meta.meta;
  print('pack: ${meta.name}');

  for (final i in meta.types) {
    print(' - type: ${i.name}');

    for (final j in i.fields) {
      print('     - ${j.name}, kind: ${j.kind.name}, type: ${j.type.name}');
    }
  }
}
