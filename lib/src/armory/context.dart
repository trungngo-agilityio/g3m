part of g3.armory;

typedef NodeBuildFunc<T extends Node> = Node Function(
    BuildContext context, T node);

abstract class BuildContext {
  T findAncestorNodeOfExactType<T extends Node>();

  T dependOnAncestorNodeOfExactType<T extends Node>();

  Iterable<Node> get ancestors;
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

abstract class ExactlyOneNode<T extends ExactlyOneNode<T>> implements Node {
  @override
  Node build(BuildContext context) {
    if (context.findAncestorNodeOfExactType<T>() != null) {
      // Allows maximum one instance of this class.
      return null;
    }

    return buildOne(context);
  }

  Node buildOne(BuildContext context);
}

abstract class Renderer {
  void render(RenderContext context);
}

abstract class PostRenderer {
  void postRender(RenderContext context);
}
