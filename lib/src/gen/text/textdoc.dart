part of g3gen;

class TextConfig {
  final int tabSize;
  final bool useTab;
  final int blankLinesBetweenParagraph;
  String _paragraphSeparator;

  WriterConfig _writerConfig;

  WriterConfig toWriterConfig() {
    return _writerConfig ??= WriterConfig(tabSize: tabSize, useTab: useTab);
  }

  TextConfig(
      {this.blankLinesBetweenParagraph = 2,
      this.tabSize = 4,
      this.useTab = false}) {
    _init();
  }

  TextConfig.useSpace2({this.blankLinesBetweenParagraph = 2})
      : tabSize = 2,
        useTab = false {
    _init();
  }

  TextConfig.useSpace4({this.blankLinesBetweenParagraph = 2})
      : tabSize = 4,
        useTab = false {
    _init();
  }

  TextConfig.useTab({this.blankLinesBetweenParagraph = 2})
      : tabSize = 4,
        useTab = true {
    _init();
  }

  void _init() {
    _paragraphSeparator = '\n' * blankLinesBetweenParagraph;
  }
}

class TextDoc implements WritableProjectItem {
  final List<TextParagraph> paragraphs = [];
  TextConfig _config;

  TextDoc([this._config]) {
    _config ??= TextConfig.useSpace2();

    var p = TextParagraph._(this);
    paragraphs.add(p);
  }

  /// Gets the text document content.
  String get content =>
      paragraphs.map((e) => e.content).join(_config._paragraphSeparator);

  TextParagraph get top => paragraphs.first;

  TextParagraph get bottom => paragraphs.last;

  @override
  void write(StringSink out) {
    out.write(content);
  }
}

class TextParagraph {
  final TextDoc _doc;

  Writer _writer;
  StringBuffer _buf;

  TextParagraph._(this._doc);

  String get content => _buf == null ? '' : _buf.toString();

  /// Gets the writer for this paragraph.
  Writer get writer {
    if (_writer != null) return _writer;

    _buf = StringBuffer();
    return _writer = Writer(_buf, config: _doc._config.toWriterConfig());
  }

  /// Inserts a new paragraph before this one.
  TextParagraph before() => _insertNew(0);

  /// Inserts a new paragraph before this one.
  TextParagraph after() => _insertNew(1);

  TextParagraph _insertNew(int delta) {
    var idx = _doc.paragraphs.indexOf(this);
    var p = TextParagraph._(_doc);
    _doc.paragraphs.insert(idx + delta, p);
    return p;
  }
}
