part of g3gen;

class WriterConfig {
  final int tabSize;
  final bool useTab;

  WriterConfig({this.tabSize = 4, this.useTab = false});

  WriterConfig.useSpace2()
      : tabSize = 2,
        useTab = false;

  WriterConfig.useSpace4()
      : tabSize = 4,
        useTab = false;

  WriterConfig.useTab()
      : tabSize = 4,
        useTab = true;
}

/// The most basic writer that provides core functions for text generation.
///
class Writer {
  /// The output sink. Can be string or to std output.
  final StringSink _io;

  final WriterConfig _config;

  String _tabSpace = '';
  String _newLineSpace = '';

  /// The current tab level.
  int _tab = 0;

  /// True indicates that this is the very first line got written.
  bool _firstLine = true;
  String _firstLineText;

  /// True indicates that this is the very first line after a tab or untab.
  bool _firstLineAfterTab = false;

  /// This is the text to be displayed for first line after tab.
  String _firstLineAfterTabText;

  /// True indicates that this is a very first line of a paragraph.
  bool _firstLineAfterParagraph = false;

  /// This is the text to be display for the first line after a paragraph.
  String _firstLineAfterParagraphText;
  String _nonFirstLineAfterParagraphText;

  Writer(this._io, {WriterConfig config})
      : _config = config ?? WriterConfig.useSpace2() {
    _firstLineText = '';
    _firstLineAfterTabText = '';
    _firstLineAfterParagraphText = '';
    _nonFirstLineAfterParagraphText = '';
  }

  void tab() {
    _tab++;
    _firstLineAfterTab = true;
    _updateSpaceTab();
  }

  void untab() {
    _tab--;

    assert(_tab >= 0);

    _firstLineAfterTab = true;
    _updateSpaceTab();
  }

  /// recomputes the additional text to be put in front of every line.
  ///
  void _updateSpaceTab() {
    if (_config.useTab) return;
    _tabSpace = _config.useTab ? '\t' : ' ' * _config.tabSize;

    _newLineSpace = _tabSpace * _tab;
    _firstLineAfterTabText = _newLineSpace;
    _firstLineAfterParagraphText = _newLineSpace;
    _nonFirstLineAfterParagraphText = _newLineSpace;
  }

  /// Writes out the specified text to the current line.
  ///
  void write(Object o) {
    String s;

    if (o != null) {
      s = o.toString();

      if (_firstLine) {
        // This is the very first line of the entire writer.
        // Do some special writing if need to.
        _io.write(_firstLineText);
      } else if (_firstLineAfterTab) {
        // This is the very first line after a tab.
        _io.write(_firstLineAfterTabText);
      } else if (_firstLineAfterParagraph) {
        // This is the first line after a beginning of a paragraph.
        // Add some extra if need to.
        _io.write(_firstLineAfterParagraphText);
      } else {
        // This is a beginning of a normal line.
        // Add some extra text if need to.
        _io.write(_nonFirstLineAfterParagraphText);
      }

      if (!_config.useTab) {
        // Replaces all tab character to space
        s = s.replaceAll('\t', _tabSpace);
      }

      // For all new line character, put some extra text to it
      // so that the current indentation setting is respected.
      s = s.replaceAll('\n', '\n' + _nonFirstLineAfterParagraphText);

      // Writes out the current content.
      _io.write(s);

      // Marks that it becomes a normal line now.
      _firstLine = false;
      _firstLineAfterTab = false;
      _firstLineAfterParagraph = false;
    }
  }

  /// Writes the specified text if any, and make a new line.
  void writeln([Object s]) {
    if (s != null) write(s);
    _io.writeln();
  }

  /// Makes a new paragraph.
  ///
  void paragraph([int lines = 2]) {
    for (var i = 0; i < lines; i++) {
      _io.writeln();
    }

    _firstLineAfterParagraph = true;
  }

  /// Begins a new paragraph.
  Writer operator ~() {
    paragraph();
    return this;
  }

  /// Appends additional text to the current line.
  void operator +(Object s) {
    write(s);
  }

  /// Begins a new line and append the text.
  void operator ^(Object s) {
    writeln();
    write(s);
  }

  /// Tabs and write the text.
  void operator >>(Object s) {
    writeln();
    tab();
    write(s);
  }

  /// Untab and write the text.
  void operator <<(Object s) {
    writeln();
    untab();
    write(s);
  }
}

typedef WriterFunc = void Function(Writer w);
typedef StringFunc = String Function(String s);

var _normalizeExpr = RegExp('\\s+');

/// Normalizes a string to non trailing/leading spaces. Also,
/// there is no double spaces.
///
StringFunc norm = (s) => s?.trim()?.replaceAll(_normalizeExpr, ' ');

StringFunc noop = (s) => s;
StringFunc ignore = (s) => '';
StringFunc upper = (s) => s.toUpperCase();
StringFunc lower = (s) => s.toLowerCase();
StringFunc camel = (s) => ReCase(s).camelCase;
StringFunc pascal = (s) => ReCase(s).pascalCase;
StringFunc snake = (s) => ReCase(s).snakeCase;
StringFunc dot = (s) => ReCase(s).dotCase;
StringFunc path = (s) => ReCase(s).pathCase;
StringFunc param = (s) => ReCase(s).paramCase;
StringFunc header = (s) => ReCase(s).headerCase;
StringFunc title = (s) => ReCase(s).titleCase;
StringFunc constant = (s) => ReCase(s).constantCase;
StringFunc sentence = (s) => ReCase(s).sentenceCase;
StringFunc quote = (s) => '\'${s.replaceAll('\'', '\\\'')}\'';
StringFunc doubleQuote = (s) => '"${s.replaceAll('"', '\\"')}"';

/// See: https://www.markdownguide.org/basic-syntax/
class MarkdownFunc {
  final StringFunc h1 = (s) => '# $s';
  final StringFunc h2 = (s) => '## $s';
  final StringFunc h3 = (s) => '### $s';
  final StringFunc h4 = (s) => '#### $s';
  final StringFunc h5 = (s) => '##### $s';
  final StringFunc h6 = (s) => '###### $s';

  StringFunc h(int level) {
    if (level > 6) level = 6;
    return (s) => '#' * level + ' ' + s;
  }

  final StringFunc bold = (s) => '**$s** ';
  final StringFunc italic = (s) => '*$s* ';
  final StringFunc code = (s) => '`$s`' ;
  final String rule = '---';

  StringFunc link([String title]) {
    return (url) => title == null ? '<$url>' : '[$title]($url)';
  }

  StringFunc image([String text, String title]) {
    title = title == null ? '' : ' ' + title;
    return (url) => '![$text]($url$title)';
  }

  final StringFunc email = (s) => '<$s>';
}

var mk = MarkdownFunc();

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

var code = CodeFunc._();

extension StringFuncExtension on StringFunc {
  StringFunc operator *(StringFunc f) {
    return (s) => this(f(s));
  }

  String operator %(Object s) {
    return s == null ? null : this(s.toString());
  }
}
