import 'package:g3m/stimpack2_core.dart';
import 'package:g3m/stimpack2_meta.dart';
import 'package:g3m/stimpack2_meta_techlab.dart';
import 'package:g3m/stimpack2_model.dart';

void main() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'story');

  final tStory = t.symbolOf(name: 'epic', package: meta);
  final tAction = t.symbolOf(name: 'action', package: meta);
  final tActor = t.symbolOf(name: 'actor', package: meta);

  tStory.fields = {
    f.of(name: 'actor', type: tActor).required(),
    f.of(name: 'action', type: tAction).required(),
  };

  stimpackGen(meta, 'lib/src/stimpack2/${meta.name.snake()}');
}
