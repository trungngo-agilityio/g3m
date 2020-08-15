part of g3.armory;

class _Context implements BuildContext, RenderContext {
  final _Context parent;
  final Node node;

  List<_Context> _children;

  _Context(this.parent, this.node);

  @override
  T dependOnAncestorNodeOfExactType<T extends Node>() {
    final res = findAncestorNodeOfExactType<T>();
    assert(res != null, 'Cannot find ancestor of type ${T}');
    return res;
  }

  @override
  Iterable<Node> get ancestors sync* {
    var ctx = parent;
    while (ctx != null) {
      yield ctx.node;
      ctx = ctx.parent;
    }
  }

  @override
  T findAncestorNodeOfExactType<T extends Node>() {
    for (final i in ancestors) {
      if (i is T) return i;
    }
    return null;
  }

  void build() {
    _children = [];

    if (node is Container) {
      final container = node as Container;
      if (container.children != null) {
        for (final i in container.children) {
          if (i != null) {
            final child = i is Node ? i : Text.of(i);

            final context = _Context(this, child)..build();
            _children.add(context);
          }
        }
      }
    } else {
      var end = false;
      do {
        final builtNode = node.build(this);
        if (builtNode != null) {
          final context = _Context(this, builtNode)..build();
          _children.add(context);
        }

        if (node is LoopNode) {
          end = (node as LoopNode)?.isDone;
        } else {
          end = true;
        }
      } while (!end);
    }
  }

  void render() async {
    if (node is Renderer) {
      await (node as Renderer).render(this);
    }

    for (final i in _children) {
      await i.render();
    }

    if (node is PostRenderer) {
      await (node as PostRenderer).postRender(this);
    }
  }

  int _blockLevel;

  @override
  int get blockLevel => _blockLevel ?? parent?.blockLevel;

  @override
  set blockLevel(value) => _blockLevel = value;

  StringSink _out;

  @override
  StringSink get out => _out ?? parent?.out ?? io.stdout;

  String _path;

  @override
  String get path => _path ?? parent?.path;

  @override
  set out(value) {
    _out = value;
  }

  @override
  set path(value) {
    _path = value;
  }

  bool _aborted;

  @override
  void abort() {
    _aborted = true;
  }
}

class Program {
  final Node root;

  Program._(this.root);

  void _execute() async {
    final context = _Context(null, Directory.absolute('.', root));
    context.build();
    await context.render();
  }

  static void execute(Node root) async {
    final program = Program._(root);
    await program._execute();
  }
}
