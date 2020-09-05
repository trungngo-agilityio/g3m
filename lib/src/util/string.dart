part of g3.util;

typedef StringFunc = String Function(String s);

final _normalizeExpr = RegExp('\\s+');

class StringFuncs {
  /// Normalizes a string to non trailing/leading spaces. Also,
  /// there is no double spaces.
  ///
  static final StringFunc norm =
      (s) => s?.trim()?.replaceAll(_normalizeExpr, ' ');

  static final StringFunc noop = (s) => s;
  static final StringFunc ignore = (s) => '';
  static final StringFunc upper =
      (s) => s != null && s.isNotEmpty ? s.toUpperCase() : s;
  static final StringFunc lower =
      (s) => s != null && s.isNotEmpty ? s.toLowerCase() : s;
  static final StringFunc camel =
      (s) => s != null && s.isNotEmpty ? ReCase.forCode(s).camel : s;
  static final StringFunc pascal =
      (s) => s != null && s.isNotEmpty ? ReCase.forCode(s).pascal : s;
  static final StringFunc snake =
      (s) => s != null && s.isNotEmpty ? ReCase.forCode(s).snake : s;
  static final StringFunc dot =
      (s) => s != null && s.isNotEmpty ? ReCase.forCode(s).dot : s;
  static final StringFunc path =
      (s) => s != null && s.isNotEmpty ? ReCase.forCode(s).path : s;
  static final StringFunc param =
      (s) => s != null && s.isNotEmpty ? ReCase.forCode(s).param : s;
  static final StringFunc header =
      (s) => s != null && s.isNotEmpty ? ReCase.forCode(s).header : s;
  static final StringFunc title =
      (s) => s != null && s.isNotEmpty ? ReCase.forCode(s).title : s;
  static final StringFunc constant =
      (s) => s != null && s.isNotEmpty ? ReCase.forCode(s).constant : s;

  static final StringFunc sentence =
      (s) => s != null && s.isNotEmpty ? ReCase.forCode(s).sentence : s;
  static final StringFunc singleQuotes = (s) =>
      s != null && s.isNotEmpty ? '\'${s.replaceAll('\'', '\\\'')}\'' : s;
  static final StringFunc doubleQuotes =
      (s) => s != null && s.isNotEmpty ? '"${s.replaceAll('"', '\\"')}"' : s;

  /// Lazy init the code func.
  static CodeFunc _code;

  static CodeFunc get code => _code ??= CodeFunc._();

  static MarkdownFunc _markdown;

  static MarkdownFunc get markdown => _markdown ??= MarkdownFunc._();
}

class CodeFunc {
  StringFunc commentJavaDoc;
  StringFunc commentDoubleSplash;
  StringFunc commentTripleSplash;
  StringFunc commentHash;
  StringFunc parenthesis;
  StringFunc curlyBracket;
  StringFunc bracket;

  StringFunc underscorePrefix;

  StringFunc prefix(String ch) => (s) => ch + s;

  StringFunc suffix(String ch) => (s) => ch + s;

  StringFunc _comment(String ch) => (s) => ch + s.split('\n').join('\n$ch');

  CodeFunc._() {
    commentHash = _comment('# ');
    commentDoubleSplash = _comment('// ');
    commentTripleSplash = _comment('/// ');
    commentJavaDoc = (s) => '/**\n * ' + s.split('\n').join('\n * ') + '\n */';
    parenthesis = (s) => '($s)';
    curlyBracket = (s) => '{$s}';
    bracket = (s) => '[$s]';
    underscorePrefix = prefix('_');
  }
}

class MarkdownFunc {
  final StringFunc h1 = (s) => h(1, s);
  final StringFunc h2 = (s) => h(2, s);
  final StringFunc h3 = (s) => h(3, s);
  final StringFunc h4 = (s) => h(4, s);
  final StringFunc h5 = (s) => h(5, s);
  final StringFunc h6 = (s) => h(6, s);

  static String h(int level, String s) {
    if (level > 6) level = 6;
    return s?.isNotEmpty == true ? '#' * level + ' ' + s : s;
  }

  final StringFunc bold = (s) => s?.isNotEmpty == true ? '**$s**' : s;
  final StringFunc italic = (s) => s?.isNotEmpty == true ? '*$s*' : s;
  final StringFunc code = (s) => s?.isNotEmpty == true ? '`$s`' : s;

  final String rule = '---';

  StringFunc link([String title]) {
    return (url) => title == null ? '<$url>' : '[$title]($url)';
  }

  StringFunc image([String text, String title]) {
    title = title == null ? '' : ' ' + title;
    return (url) => '![$text]($url$title)';
  }

  final StringFunc email = (s) => '<$s>';

  MarkdownFunc._();
}

extension G3StringExtension on String {
  String removeIfStartsWith(String prefix) {
    if (startsWith(prefix)) {
      return substring(prefix.length);
    }

    return this;
  }
}
