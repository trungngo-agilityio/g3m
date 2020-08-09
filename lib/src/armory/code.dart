part of g3.armory;

class CodeFile implements Node {
  /// The file name without extension.
  final String name;

  /// The file extension.
  final String extension;

  /// The syntax name. E.g., csharp, java, etc.
  final String syntax;

  /// The header file comment.
  final Node comment;

  /// The file content.
  final Node content;

  CodeFile({
    @required this.name,
    @required this.extension,
    this.syntax,
    this.comment,
    this.content,
  });

  @override
  Node build(BuildContext context) {
    return File(
        '${name}.${extension}',
        Container([
          CodeComment(comment),
          content,
        ]));
  }
}

class CodeBlock implements Node, Renderer, PostRenderer {
  final Node content;

  CodeBlock(this.content);

  @override
  Node build(BuildContext context) {
    return Indent(content);
  }

  @override
  void render(RenderContext context) {
    context.blockLevel++;
  }

  @override
  void postRender(RenderContext context) {
    context.out.writeln();
  }
}

/// Defines different access level for a piece of code. For example,
/// a class method can be either public, private, or protected.
///
enum CodeAccess { public, private, protected }

class CodeDataType implements Node {
  final bool array;
  final String name;

  CodeDataType(this.array, this.name);

  @override
  Node build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class CodeField implements Node {
  final CodeDataType type;
  final String name;

  CodeField(this.type, this.name);

  @override
  Node build(BuildContext context) {
    return Container([
      type,
      Text(name),
    ]);
  }
}

class CodeCommentConfig extends SingleChildNode {
  final StringFunc transform;
  final Node child;

  CodeCommentConfig(this.transform, this.child) : super(child);

  factory CodeCommentConfig.doubleSplash(Node child) =>
      CodeCommentConfig(code.commentDoubleSplash, child);

  factory CodeCommentConfig.tripleSplash(Node child) =>
      CodeCommentConfig(code.commentTripleSplash, child);

  factory CodeCommentConfig.javaDoc(Node child) =>
      CodeCommentConfig(code.commentJavaDoc, child);

  factory CodeCommentConfig.hash(Node child) =>
      CodeCommentConfig(code.commentHash, child);

  static CodeCommentConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CodeCommentConfig>();
  }
}

class CodeComment implements Node {
  final Node content;

  CodeComment(this.content);

  factory CodeComment.of({
    String text,
    Node content,
  }) {
    assert(content != null || text != null,
        'either content or text must be specified');

    content ??= Text(text);
    return CodeComment(content);
  }

  @override
  Node build(BuildContext context) {
    final config = CodeCommentConfig.of(context);

    return Container([
      TextTransform(content, config.transform),
      NewLine(),
    ]);
  }
}

class CodeAnnotation implements Node {
  @override
  Node build(BuildContext context) {
    return null;
  }
}

class CodeClass implements Node {
  final String name;
  final bool abstract;
  final bool interface;
  final CodeAccess access;
  final List<CodeField> fields;
  final List<CodeFunction> functions;
  final String extend;
  final List<String> implement;
  final List<CodeAnnotation> annotations;
  final Node comment;

  CodeClass(
    this.name, {
    this.abstract,
    this.interface,
    this.access,
    this.fields,
    this.functions,
    this.extend,
    this.implement,
    this.annotations,
    this.comment,
  });

  @override
  Node build(BuildContext context) {
    return Container([
      CodeComment(comment),
      Container(annotations),
      Text('interface ${name} {'),
      NewLine(),
      CodeBlock(
        Container([
          ...fields,
          NewLine(),
          ...functions,
        ]),
      ),
      NewLine(),
      Text('}'),
      NewLine(),
    ]);
  }
}

class CodeFunction implements Node {
  @override
  Node build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
