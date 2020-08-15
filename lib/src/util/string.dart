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
      (s) => s != null && s.isNotEmpty ? ReCase(s).camelCase : s;
  static final StringFunc pascal =
      (s) => s != null && s.isNotEmpty ? ReCase(s).pascalCase : s;
  static final StringFunc snake =
      (s) => s != null && s.isNotEmpty ? ReCase(s).snakeCase : s;
  static final StringFunc dot =
      (s) => s != null && s.isNotEmpty ? ReCase(s).dotCase : s;
  static final StringFunc path =
      (s) => s != null && s.isNotEmpty ? ReCase(s).pathCase : s;
  static final StringFunc param =
      (s) => s != null && s.isNotEmpty ? ReCase(s).paramCase : s;
  static final StringFunc header =
      (s) => s != null && s.isNotEmpty ? ReCase(s).headerCase : s;
  static final StringFunc title =
      (s) => s != null && s.isNotEmpty ? ReCase(s).titleCase : s;
  static final StringFunc constant =
      (s) => s != null && s.isNotEmpty ? ReCase(s).constantCase : s;

  static final StringFunc sentence =
      (s) => s != null && s.isNotEmpty ? ReCase(s).sentenceCase : s;
  static final StringFunc quote = (s) =>
      s != null && s.isNotEmpty ? '\'${s.replaceAll('\'', '\\\'')}\'' : s;
  static final StringFunc doubleQuote =
      (s) => s != null && s.isNotEmpty ? '"${s.replaceAll('"', '\\"')}"' : s;

  /// Lazy init the code func.
  static CodeFunc _code;

  static CodeFunc get code => _code ??= CodeFunc._();
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
