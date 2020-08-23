part of g3.techlab;

typedef TextMergeFunction = String Function(List<String> args);

class TextMerge implements Node, PostRenderer {
  final TextMergeFunction func;

  final List<Node> children;

  TextMerge({
    @required this.func,
    @required this.children,
  }) : assert(func != null, 'merge function is required');

  final List<StringBuffer> _contents = [];

  @override
  Node build(BuildContext context) {
    if (children?.isNotEmpty != true) return null;
    final outputs = <Node>[];
    for (final i in children) {
      final buf = StringBuffer();
      _contents.add(buf);
      outputs.add(OutputRedirect(buf, i));
    }
    return Container(outputs);
  }

  @override
  void postRender(RenderContext context) {
    final args = _contents.map((e) => e?.toString()).toList();
    final s = func(args);
    context.out.write(s);
  }
}
