part of g3.techlab;

class Pad implements Node {
  final String prefix;
  final String suffix;
  final Node content;
  final bool onlyIfMissing;

  Pad(this.prefix, this.suffix, this.content, {this.onlyIfMissing = false});

  factory Pad.left(String prefix, Node content, {bool onlyIfMissing}) =>
      Pad.of(prefix, null, content, onlyIfMissing: onlyIfMissing);

  factory Pad.right(String suffix, Node content, {bool onlyIfMissing}) =>
      Pad.of(null, suffix, content, onlyIfMissing: onlyIfMissing);

  factory Pad.of(String prefix, String suffix, Node content,
          {bool onlyIfMissing}) =>
      Pad(
        prefix,
        suffix,
        content,
        onlyIfMissing: onlyIfMissing,
      );

  factory Pad.curlyBrackets(Node content, {bool onlyIfMissing}) =>
      Pad.of('{', '}', content, onlyIfMissing: onlyIfMissing);

  factory Pad.squareBrackets(Node content, {bool onlyIfMissing}) =>
      Pad.of('[', ']', content, onlyIfMissing: onlyIfMissing);

  factory Pad.parentheses(Node content, {bool onlyIfMissing}) =>
      Pad.of('(', ')', content, onlyIfMissing: onlyIfMissing);

  factory Pad.angleBrackets(Node content, {bool onlyIfMissing}) =>
      Pad.of('<', '>', content, onlyIfMissing: onlyIfMissing);

  factory Pad.singleQuotes(Node content, {bool onlyIfMissing}) =>
      Pad.of('\'', '\'', content, onlyIfMissing: onlyIfMissing);

  factory Pad.doubleQuotes(Node content, {bool onlyIfMissing}) =>
      Pad.of('"', '"', content, onlyIfMissing: onlyIfMissing);

  @override
  Node build(BuildContext context) {
    if (prefix == null && suffix == null) {
      return content;
    }

    return TextTransform(content, (s) {
      if (prefix != null &&
          prefix.isNotEmpty &&
          (onlyIfMissing != true || !s.startsWith(prefix))) {
        s = prefix + s;
      }

      if (suffix != null &&
          suffix.isNotEmpty &&
          (onlyIfMissing != true || !s.endsWith(suffix))) {
        s = s + suffix;
      }

      return s;
    });
  }
}
