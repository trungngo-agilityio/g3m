part of g3.armory;

class CodeIndentConfig implements Node {
  final int tabSize;
  final bool useTab;
  final Node content;

  CodeIndentConfig({
    this.tabSize = 2,
    this.useTab = false,
    this.content,
  });

  @override
  Node build(BuildContext context) {
    return content;
  }
}

class CodeFile implements Node {
  final String name;
  final String extension;
  final String syntax;
  final Node content;

  CodeFile({
    @required this.name,
    this.extension,
    this.syntax,
    this.content,
  });

  @override
  Node build(BuildContext context) {
    return File('${name}.${extension}', content);
  }
}

class CodeBlock implements Node, Renderer, PostRenderer {
  final Node content;

  CodeBlock(this.content);

  @override
  Node build(BuildContext context) {
    return content;
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

enum CodeCommentStyle { javaDoc, doubleSplash, tripleSplash, hash }

class CodeComment implements Node {
  final CodeCommentStyle style;
  final Node content;
  StringFunc _transform;

  CodeComment({this.style, this.content}) {
    switch (style) {
      case CodeCommentStyle.javaDoc:
        _transform = code.commentJavaDoc;
        break;
      case CodeCommentStyle.doubleSplash:
        _transform = code.commentDoubleSplash;
        break;
      case CodeCommentStyle.tripleSplash:
        _transform = code.commentTripleSplash;
        break;
      case CodeCommentStyle.hash:
        _transform = code.commentHash;
        break;
      default:
        assert(false, 'BUG');
    }
  }

  factory CodeComment.of({
    CodeCommentStyle style,
    String text,
    Node content,
  }) {
    assert(content != null || text != null,
        'either content or text must be specified');

    content ??= Text(text);
    return CodeComment(style: style, content: content);
  }

  @override
  Node build(BuildContext context) {
    return Container([
      TextTransform(content, _transform),
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
      CodeComment(content: comment),
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
