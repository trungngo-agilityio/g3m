import 'package:g3m/g3gen.dart';

import 'src/world.dart';

void main() async {
  var w = GameProgram();
  await Project.open(w, '.out/game')
    ..deploy();
}
