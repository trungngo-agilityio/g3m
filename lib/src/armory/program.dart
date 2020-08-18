part of g3.armory;

class _Context implements BuildContext, RenderContext {
  /// The parent context if any.
  final _Context parent;

  /// The node that this context is built for.
  final Node node;

  @override
  String dir;

  @override
  String file;

  List<_Context> _children;

  Program _program;

  _Context.root(this._program, this.node) : parent = null;

  _Context.childOf(this.parent, this.node) {
    dir = parent?.dir;
    file = parent?.file;
    _program = parent?._program;
  }

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

            final context = _Context.childOf(this, child)..build();
            _children.add(context);
          }
        }
      }
    } else {
      var end = false;
      do {
        final builtNode = node.build(this);
        if (builtNode != null) {
          final context = _Context.childOf(this, builtNode)..build();
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

  void render() {
    if (node is Renderer) {
      (node as Renderer).render(this);
    }

    for (final i in _children) {
      i.render();
    }

    if (node is PostRenderer) {
      (node as PostRenderer).postRender(this);
    }
  }

  StringSink _out;

  @override
  StringSink get out => _out ?? parent?.out ?? io.stdout;

  @override
  set out(value) {
    _out = value;
  }

  bool _aborted;

  @override
  void abort() {
    _aborted = true;
  }

  @override
  bool get yesToAll {
    return _program._yesToAll;
  }

  @override
  set yesToAll(bool value) {
    _program._yesToAll = value;
  }
}

class Program {
  final Node root;

  bool _yesToAll;

  Program._(this.root);

  void _execute() {
    final context = _Context.root(this, Directory.absolute('.', root));

    context.build();
    context.render();
  }

  static void execute(Node root) {
    final program = Program._(root);
    program._execute();
  }
}
