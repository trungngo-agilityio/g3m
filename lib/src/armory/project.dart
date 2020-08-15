part of g3.armory;

class Project implements Node {
  final String path;
  final Node content;

  Project({this.path, this.content});

  @override
  Node build(BuildContext context) {
    // Makes folder a parent node for all sub project.
    return Directory.relative(path, content);
  }
}
