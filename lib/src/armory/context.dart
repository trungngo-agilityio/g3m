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

class NodeBuilder implements Node {
  final Node Function(BuildContext context) _builder;

  NodeBuilder(this._builder);

  @override
  Node build(BuildContext context) {
    return _builder(context);
  }
}

abstract class ExactlyOneNode<T extends ExactlyOneNode<T>> implements Node {
  final Node _child;

  ExactlyOneNode(this._child);

  @override
  Node build(BuildContext context) {
    if (context.findAncestorNodeOfExactType<T>() != null) {
      // Allows maximum one instance of this class.
      return _child;
    }

    return buildOne(context, _child);
  }

  Node buildOne(BuildContext context, Node child);
}

abstract class LoopNode extends Node {
  bool get isDone;
}

abstract class Renderer {
  void render(RenderContext context);
}

abstract class PostRenderer {
  void postRender(RenderContext context);
}
