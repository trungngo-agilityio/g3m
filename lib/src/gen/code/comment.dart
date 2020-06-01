part of g3gen;

// -----------------------------------------------------------------------------
// Comment
// -----------------------------------------------------------------------------

class CodeComment {
  final CodeConfig _config;

  StringBuffer _buf;

  /// Simple text comment, usually one liner.
  String _text;

  /// Get the code comment content.
  ///
  String get text => _buf != null ? _buf.toString() : _text;

  set text(String value) {
    _text = value;
    _buf = null;
  }

  CodeCommentWriter _writer;

  CodeComment.of(String text) : this._(null, text);

  CodeComment._(this._config, this._text);

  /// Opens the writer for the current paragraph.
  ///
  void write(WriterFunc func) {
    // Lazy init the comment writer.
    _buf = StringBuffer(_text ?? '');
    _writer ??= CodeCommentWriter._(this);

    // Clears out the initial simple comment text since it is no longer valid.
    _text = null;
    func(_writer);
  }
}

// -----------------------------------------------------------------------------
// Comment Writer
// -----------------------------------------------------------------------------

class CodeCommentWriter extends Writer {
  final CodeComment _comment;

  CodeCommentWriter._(this._comment)
      : super(_comment._buf, config: _comment._config);
}
