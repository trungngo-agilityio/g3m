part of g3.techlab;

class Pad implements Node {
  final String prefix;
  final String suffix;
  final Node content;
  final bool onlyIfMissing;

  Pad._(this.prefix, this.suffix, this.content, {this.onlyIfMissing = false});

  factory Pad.left(String prefix, dynamic content, {bool onlyIfMissing}) =>
      Pad.of(prefix, null, content, onlyIfMissing: onlyIfMissing);

  factory Pad.right(String suffix, dynamic content, {bool onlyIfMissing}) =>
      Pad.of(null, suffix, content, onlyIfMissing: onlyIfMissing);

  factory Pad.of(String prefix, String suffix, dynamic content,
          {bool onlyIfMissing}) =>
      Pad._(
        prefix,
        suffix,
        Node.of(content),
        onlyIfMissing: onlyIfMissing,
      );

  factory Pad.curlyBrackets(dynamic content, {bool onlyIfMissing}) =>
      Pad.of('{', '}', content, onlyIfMissing: onlyIfMissing);

  factory Pad.squareBrackets(dynamic content, {bool onlyIfMissing}) =>
      Pad.of('[', ']', content, onlyIfMissing: onlyIfMissing);

  factory Pad.parentheses(dynamic content, {bool onlyIfMissing}) =>
      Pad.of('(', ')', content, onlyIfMissing: onlyIfMissing);

  factory Pad.angleBrackets(dynamic content, {bool onlyIfMissing}) =>
      Pad.of('<', '>', content, onlyIfMissing: onlyIfMissing);

  factory Pad.singleQuotes(dynamic content, {bool onlyIfMissing}) =>
      Pad.of('\'', '\'', content, onlyIfMissing: onlyIfMissing);

  factory Pad.doubleQuotes(dynamic content, {bool onlyIfMissing}) =>
      Pad.of('"', '"', content, onlyIfMissing: onlyIfMissing);

  factory Pad.tildaQuotes(dynamic content, {bool onlyIfMissing}) =>
      Pad.of('`', '`', content, onlyIfMissing: onlyIfMissing);

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
