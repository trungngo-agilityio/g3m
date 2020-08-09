part of g3.armory;

abstract class BuildContext {
  T findAncestorNodeOfExactType<T extends Node>();

  T dependOnInheritedWidgetOfExactType<T extends Node>();
}

abstract class RenderContext {
  String path;
  StringSink out;
  int blockLevel;
}

abstract class Node {
  Node build(BuildContext context);
}

class NoChildNode implements Node {
  @override
  Node build(BuildContext context) {
    return null;
  }
}

class SingleChildNode implements Node {
  final Node _child;

  SingleChildNode(this._child);

  @override
  Node build(BuildContext context) {
    return _child;
  }
}

abstract class Renderer {
  void render(RenderContext context);
}

abstract class PostRenderer {
  void postRender(RenderContext context);
}
