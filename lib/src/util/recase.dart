part of g3.util;

/// An instance of text to be re-cased.
/// Credits: https://pub.dev/packages/recase
/// Notes: need to modify this library to handle special symbol for
/// code generation better. Especially for _ for dart private field
/// and ? for optional field.
class ReCase {
  final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');
  final RegExp _symbolRegex = RegExp(r'[ ./_\-]');

  /// The list of words in the original text.
  List<String> _words;

  /// If the original text starts with a symbol, preserve it.
  String _startSymbol;

  /// If the original text end with a symbol, preserve it.
  String _endSymbol;

  ReCase(String text) {
    _process(text, false);
  }

  ReCase.forCode(String text) {
    _process(text, true);
  }

  void _process(String text, bool forCode) {
    if (text == null) return;

    // The buffer to capture the current word.
    final wordBuf = StringBuffer();

    // The buffer to capture the current symbol.
    StringBuffer symbolBuf;

    if (forCode) {
      symbolBuf = StringBuffer();
    }

    // The list of words as the result.
    _words = <String>[];

    final isAllCaps = !text.contains(RegExp('[a-z]'));

    for (var i = 0; i < text.length; i++) {
      final char = String.fromCharCode(text.codeUnitAt(i));
      final nextChar = (i + 1 == text.length
          ? null
          : String.fromCharCode(text.codeUnitAt(i + 1)));

      if (_symbolRegex.hasMatch(char)) {
        if (forCode && char == '_') {
          symbolBuf.write(char);
        }
        continue;
      } else {
        // Just hit the beginning for new word.
        // clear out the symbol buf
        if (forCode) {
          final symbol = symbolBuf.toString();
          _startSymbol ??= symbol;
          symbolBuf.clear();
        }
      }

      wordBuf.write(char);

      final isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) ||
          _symbolRegex.hasMatch(nextChar);

      if (isEndOfWord) {
        _words.add(wordBuf.toString());
        wordBuf.clear();
      }
    }

    if (forCode) {
      final symbol = symbolBuf.toString();
      _endSymbol = symbol;
    }

    _startSymbol ??= '';
    _endSymbol ??= '';
  }

  /// camelCase
  String get camelCase => _getCamelCase();

  /// CONSTANT_CASE
  String get constantCase => _getConstantCase();

  /// Sentence case
  String get sentenceCase => _getSentenceCase();

  /// snake_case
  String get snakeCase => _getSnakeCase();

  /// dot.case
  String get dotCase => _getSnakeCase(separator: '.');

  /// param-case
  String get paramCase => _getSnakeCase(separator: '-');

  /// path/case
  String get pathCase => _getSnakeCase(separator: '/');

  /// PascalCase
  String get pascalCase => _getPascalCase();

  /// Header-Case
  String get headerCase => _getPascalCase(separator: '-');

  /// Title Case
  String get titleCase => _getPascalCase(separator: ' ');

  String _getCamelCase({String separator = ''}) {
    if (_words == null) return null;

    var words = _words.map(_upperCaseFirstLetter).toList();
    words[0] = words[0].toLowerCase();

    var s = words.join(separator);
    return separator == '' ? _startSymbol + s + _endSymbol : s;
  }

  String _getConstantCase({String separator = '_'}) {
    if (_words == null) return null;

    var words = _words.map((word) => word.toUpperCase()).toList();
    var s = words.join(separator);
    return separator == '_' ? _startSymbol + s + _endSymbol : s;
  }

  String _getPascalCase({String separator = ''}) {
    if (_words == null) return null;
    var words = _words.map(_upperCaseFirstLetter).toList();

    var s = words.join(separator);
    return separator == '' ? _startSymbol + s + _endSymbol : s;
  }

  String _getSentenceCase({String separator = ' '}) {
    if (_words == null) return null;
    var words = _words.map((word) => word.toLowerCase()).toList();
    words[0] = _upperCaseFirstLetter(words[0]);

    return words.join(separator);
  }

  String _getSnakeCase({String separator = '_'}) {
    if (_words == null) return null;
    var words = _words.map((word) => word.toLowerCase()).toList();

    var s = words.join(separator);
    return separator == '_' ? _startSymbol + s + _endSymbol : s;
  }

  String _upperCaseFirstLetter(String word) {
    return '${word.substring(0, 1).toUpperCase()}${word.substring(1).toLowerCase()}';
  }
}

extension StringReCase on String {
  String get camelCase => ReCase(this).camelCase;

  String get constantCase => ReCase(this).constantCase;

  String get sentenceCase => ReCase(this).sentenceCase;

  String get snakeCase => ReCase(this).snakeCase;

  String get dotCase => ReCase(this).dotCase;

  String get paramCase => ReCase(this).paramCase;

  String get pathCase => ReCase(this).pathCase;

  String get pascalCase => ReCase(this).pascalCase;

  String get headerCase => ReCase(this).headerCase;

  String get titleCase => ReCase(this).titleCase;
}
