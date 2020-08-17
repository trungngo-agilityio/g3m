part of g3.armory;

/// The simple node that writes the specified [text] to the
/// ancestor's output sink.
///
class Text extends NoChildNode implements Renderer {
  final String text;

  Text._(String text) : text = text?.toString();

  factory Text.of(dynamic value) {
    return _parseNode<Text>(value, (v) => Text._(v?.toString()));
  }

  factory Text.space([int count]) => Text._(' ' * (count ?? 1));

  @override
  void render(RenderContext context) {
    if (text == null) return;
    // Writes out the text as is.
    context.out.write(text);
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
