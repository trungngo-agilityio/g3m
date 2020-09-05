part of g3.techlab;

/// The simple node that writes the specified [name] to the
/// ancestor's output sink.
///
class Text extends NoChildNode implements Renderer {
  final String name;

  Text._(String text) : name = text?.toString();

  factory Text.of(dynamic value) {
    return _parseNode<Text>(value, (v) => Text._(v?.toString()));
  }

  factory Text.space([int count]) => Text._(' ' * (count ?? 1));

  @override
  void render(RenderContext context) {
    if (name == null) return;
    // Writes out the text as is.
    context.out.write(name);
  }
}

/// The simple node that writes a new line character to the
/// ancestor's output sink.
///
class NewLine extends NoChildNode implements Renderer {
  @override
  void render(RenderContext context) {
    context.out.writeln();
  }
}
