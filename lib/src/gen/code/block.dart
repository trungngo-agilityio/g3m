part of g3gen;

// -----------------------------------------------------------------------------
// Block
// -----------------------------------------------------------------------------

/// Provides ability to write random code block in the document.
///
class CodeBlock {
  final CodeConfig _config;

  StringBuffer _buf;

  /// This is the simple string text for the code block.
  String _text;

  /// Gets the code block content. It is either the simple [_text] or
  /// a complicated output of the [_writer].
  ///
  String get content => _buf != null ? _buf.toString() : _text;

  CodeWriter _writer;

  CodeBlock(this._config, this._text);

  /// Opens the writer for the current code block.
  ///
  void write(WriterFunc func) {
    // Lazy init the block writer.
    _buf = StringBuffer(_text ?? '');
    _writer ??= CodeWriter._(_buf, _config);

    // Clears out the initial simple comment text since it is no longer valid.
    _text = null;
    func(_writer);
  }
}
