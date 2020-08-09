part of g3.armory;

class StatelessNode implements Node {
  @override
  Node build(BuildContext context) {
    return null;
  }
}

class StatefulNode implements Node {
  @override
  Node build(BuildContext context) {
    return null;
  }
}

class Section implements Node, Renderer {
  final String title;
  final Node content;

  Section(this.title, this.content);

  @override
  Node build(BuildContext context) {
    return CodeBlock(content);
  }

  @override
  void render(RenderContext context) {
    final level = context.blockLevel + 1;
    final w = context.out.write, wln = context.out.writeln;
    wln();
    w('#' * level);
    w(' ');
    wln(title);
  }
}

enum SourceControl { git, none }

class Repository implements Node {
  final String name;
  final SourceControl sourceControl;
  final Node content;

  Repository({this.name, this.sourceControl, this.content});

  @override
  Node build(BuildContext context) {
    final folder = Directory.of(context);
    return Directory(ioPath.join(folder.path, name), content);
  }
}
