import 'package:g3m/g3gen.dart';

import 'src/program.dart';

void main() async {
  final program = GameProgram();
  await Project.open(program, '.out/game')
    ..deploy();
}
