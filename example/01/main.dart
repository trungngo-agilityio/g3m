import 'package:g3m/g3gen.dart';

class Example01 implements Program {
  @override
  void build(ProjectFolder folder) {
    // TODO: implement build
  }

  @override
  void deploy(ProjectFolder folder) {
    // TODO: implement deploy
  }

  @override
  void load() {
    // TODO: implement load
  }

  @override
  void write(ProjectFolder folder) {
    // TODO: implement write
  }
}

void main() async {
  final ex = Example01();
  await Project.open(ex, '.out/01')
    ..deploy();
}
