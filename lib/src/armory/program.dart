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
  T findAncestorNodeOfExactType<T extends Node>() {
    if (node is T) {
      return node;
    } else {
      return parent?.findAncestorNodeOfExactType<T>();
    }
  }

  void build() {
    _children = [];

    if (node is Container) {
      final container = node as Container;
      if (container.children != null) {
        for (final i in container.children) {
          if (i != null) {
            final context = _Context(this, i)..build();
            _children.add(context);
          }
        }
      }
    } else {
      final builtNode = node.build(this);
      if (builtNode != null) {
        final context = _Context(this, builtNode)..build();
        _children.add(context);
      }
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
}

class Program {
  final Node root;

  Program._(this.root);

  void _execute() {
    final tempDir = io.Directory.systemTemp.createTempSync('g3').path;

    final context = _Context(null, Directory(tempDir, root));
    context.build();
    context.render();
  }

  static void execute(Node root) {
    final program = Program._(root);
    program._execute();
  }
}
