import 'package:g3m/g3gen.dart';

class _Example01WriteProjectItem implements WritableProjectItem {
  @override
  void write(StringSink out) {
    out.writeln('Example WriteProjectItem');
  }
}

class _Example01 implements Program {
  @override
  void load() {}

  @override
  void build(ProjectFolder folder) {
    // Demo how to generate a text file with custom output writer.
    folder.newFile('write-project-item.txt', _Example01WriteProjectItem());

    // Demo how to generate text file via a template.
    folder.newFile(
        'mustache.txt', MustacheDoc.of('Hello {{name}}!', {'name': 'world'}));
  }

  @override
  void deploy(ProjectFolder folder) {}

  @override
  void write(ProjectFolder folder) {}
}

void main() async {
  final program = _Example01();
  await Project.open(program, '.out/01')
    ..deploy();
}
