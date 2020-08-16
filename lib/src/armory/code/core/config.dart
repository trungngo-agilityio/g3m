part of g3.armory;

abstract class CodeConfigNode<T extends CodeConfigProxyNode<T>>
    extends SingleChildNode {
  final NodeBuildFunc<T> buildFunc;

  CodeConfigNode(this.buildFunc, Node child) : super(child);
}

abstract class CodeConfigProxyNode<T extends CodeConfigProxyNode<T>>
    implements Node {
  @override
  Node build(BuildContext context) {
    final config = context.dependOnAncestorNodeOfExactType<CodeConfigNode<T>>();

    // Delegates the builder function to ancestor config.
    return config.buildFunc != null ? config.buildFunc(context, this) : null;
  }
}
