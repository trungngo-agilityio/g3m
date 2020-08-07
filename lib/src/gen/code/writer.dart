part of g3gen;

// -----------------------------------------------------------------------------
// Code Writer
// -----------------------------------------------------------------------------

class CodeWriter extends Writer {
  final CodeConfig codeConfig;
  String _ln;

  CodeWriter._(StringSink buf, this.codeConfig)
      : super(buf, config: codeConfig) {
    _ln = codeConfig.lineEnding;
  }

  /// Starts a new block. This must be ended with [blockEnd].
  ///
  void blockStart() {
    writeln(codeConfig.blockStart);
    tab();
  }

  /// End the current block, started with [blockStart].
  void blockEnd() {
    writeln();
    untab();
    write(codeConfig.blockEnd);
  }

  /// A safer approach to do [blockStart] and [blockEnd] at the same time.
  ///
  void block([String s, Function() let]) {
    if ((s == null || s.isEmpty) && let == null) {
      // Writes the block in one line.
      write(codeConfig.blockStart);
      write(codeConfig.blockEnd);
    } else {
      // Writes and indent the block.
      blockStart();
      if (s != null && s.isNotEmpty) write(s);
      if (let != null) let();
      blockEnd();
    }
  }

  /// Writes out a statement, ended with correct line ending.
  ///
  void statement(String s) {
    writeln(s + _ln);
  }

  void lineEnd() {
    writeln(_ln);
  }

  /// Writes out a header comment.
  void headerComment(String s) => _comment(s, codeConfig.headerComment);

  /// Writes out a class comment.
  ///
  void classComment(String s) => _comment(s, codeConfig.classComment);

  /// Writes out a class field comment.
  ///
  void fieldComment(String s) => _comment(s, codeConfig.fieldComment);

  /// Writes out a function comment.
  ///
  void lineComment(String s) => _comment(s, codeConfig.lineComment);

  /// Writes out a function comment.
  ///
  void functionComment(String s) => _comment(s, codeConfig.functionComment);

  void _comment(String s, StringFunc func) {
    if (s == null || s.isEmpty) return;
    writeln(func % s);
  }

  void classField(String type, String name, [int index]) {
    name = codeConfig.fieldName?.call(name) ?? name;
    type = codeConfig.typeName?.call(type) ?? type;
    type = codeConfig.typeMapper?.call(type) ?? type;

    String s = codeConfig.fieldTypeName(type, name);
    if (codeConfig.fieldIndexed && index != null) {
      s += ' = $index';
    }

    statement(s);
  }
}
