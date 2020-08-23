part of g3.gen;

// ----------------------------------------------------------------------------
// Document
// -----------------------------------------------------------------------------

/// This is a mark down document.
///
class MarkdownDoc implements WritableProjectItem {
  /// The configuration that control the looks and feel of the final markdown.
  MarkdownConfig _config;

  /// The markdown title. There is only one per document.
  String title;

  final List<MarkdownParagraph> paragraphs = [];

  MarkdownDoc([this._config]) {
    _config ??= MarkdownConfig();
    var p = MarkdownParagraph._(this);
    paragraphs.add(p);
  }

  /// Gets the top (i.e., first) paragraph.
  ///
  MarkdownParagraph get top => paragraphs.first;

  /// Gets the bottom (i.e., last) paragraph;
  ///
  MarkdownParagraph get bottom => paragraphs.last;

  /// Builds the content of the document.
  ///
  String get content {
    var buf = StringBuffer();
    var wc = _config.toWriterConfig();
    var w = Writer(buf, config: wc);

    /// Writes out the document title as a markdown header 1 if any.
    if (title != null) {
      // Writes out the document title.
      var s = _config._docTitleFunc % title;
      if (_config.headerUnderline) {
        w + s;
        w ^ '=' * s.length;
      } else {
        w + mk.h1 % s;
      }
    }

    /// Writes out all paragraphs.
    ///
    for (var p in paragraphs) {
      // 2 new lines before a paragraph
      ~w;

      // Write out the paragraph title if any.
      if (p.title != null) {
        // This is the paragraph title.
        var s = _config._paragraphTitleFunc % p.title;

        if (_config.headerUnderline && p.level == 0) {
          w + s;
          // Write header with underline styling.
          w ^ '-' * p.title.length;
        } else {
          // Writes the header out with default header styling.
          w ^ mk.h(p.level + 2) % s;
        }
      }

      if (p._buf != null) {
        // Paragraph content
        w ^ p._buf.toString();
      }
    }

    return buf.toString();
  }

  @override
  void write(StringSink out) {
    out.writeln(content);
  }
}

/// ----------------------------------------------------------------------------
/// Configuration
/// ----------------------------------------------------------------------------

/// Provides configurations for [MarkdownDoc].
///
class MarkdownConfig {
  /// Sets this to true to upper case the result markdown document.
  bool docTitleUppercase;

  /// Sets this to true to uses underline header style for markdown.
  /// Only works with header 1 & 2.
  bool headerUnderline;

  /// The lazy-init writer config.
  WriterConfig _writerConfig;

  /// The function to handle the document title.
  /// If [docTitleUppercase] is set to true, this should be set to [upper].
  ///
  StringFunc _docTitleFunc;

  /// The function to handle the paragraph title.
  /// This should be set to [sentence].
  ///
  StringFunc _paragraphTitleFunc;

  MarkdownConfig({this.docTitleUppercase = true, this.headerUnderline = true}) {
    _docTitleFunc = docTitleUppercase ? upper : noop;
    _paragraphTitleFunc = sentence;
  }

  WriterConfig toWriterConfig() => _writerConfig ??= WriterConfig.useSpace2();
}
// -----------------------------------------------------------------------------
// Paragraph
// -----------------------------------------------------------------------------

/// This is a paragraph in a [MarkdownDoc].
///
class MarkdownParagraph {
  /// The owner document.
  final MarkdownDoc _doc;

  /// The indentation level of this paragraph.
  final int level;

  final bool bullet;

  /// The paragraph title.
  String title;

  /// The internal writer. This is lazy init.
  ///
  MarkdownWriter _writer;

  /// The internal string buffer for the writer. This is lazy init.
  ///
  StringBuffer _buf;

  MarkdownParagraph._(this._doc, {this.level = 0, this.bullet = false});

  /// Gets the internal writer to write the paragraph content.
  ///
  MarkdownWriter get writer {
    if (_writer != null) return _writer;

    _buf = StringBuffer();
    return _writer = MarkdownWriter._(this);
  }

  /// Opens the writer for the current paragraph.
  ///
  void write(WriterFunc func) {
    func(writer);
  }

  /// Inserts a new paragraph before this one.
  ///
  MarkdownParagraph before([String title, WriterFunc writeFunc]) =>
      _insertNew(title: title, writeFunc: writeFunc);

  /// Inserts a new paragraph before this one.
  ///
  MarkdownParagraph after([String title, WriterFunc writeFunc]) =>
      _insertNew(positionDelta: 1, title: title, writeFunc: writeFunc);

  /// Opens a bullet list paragraph.
  ///
  MarkdownParagraph list([WriterFunc writerFunc]) => _insertNew(
      positionDelta: 1, levelDelta: 1, bullet: true, writeFunc: writerFunc);

  MarkdownParagraph child([String title, WriterFunc writerFunc]) => _insertNew(
      positionDelta: 1, levelDelta: 1, title: title, writeFunc: writerFunc);

  MarkdownParagraph _insertNew(
      {int positionDelta = 0,
      int levelDelta = 0,
      bool bullet,
      String title,
      WriterFunc writeFunc}) {
    // Creates a new paragraph.
    var p = MarkdownParagraph._(_doc,
        level: level + levelDelta, bullet: bullet ?? this.bullet ?? false);

    // Inserts the paragraph into the document.
    var idx = _doc.paragraphs.indexOf(this);
    _doc.paragraphs.insert(idx + positionDelta, p);

    // Write the title and paragraph content.
    p.title = title;

    // Writes out the paragraph body if the writer is specified.
    if (writeFunc != null) writeFunc(p.writer);

    return p;
  }
}

/// The custom writer that would provide some extra texts
/// on new tab and paragraph behavior.
///
class MarkdownWriter extends Writer {
  final MarkdownParagraph _paragraph;

  MarkdownWriter._(this._paragraph)
      : super(_paragraph._buf,
            config: _paragraph._doc._config.toWriterConfig());

  @override
  void _updateSpaceTab() {
    super._updateSpaceTab();

    // The very first tab level would not have any indentation.
    if (_tab > 1) {
      _newLineSpace = _tabSpace * (_tab - 1);
    } else {
      _newLineSpace = '';
    }

    // Right after a tab, put a `*` there.
    _firstLineAfterTabText = _newLineSpace + '\n* ';

    // For the first line of a paragraph, also put a `*` to
    // begin a new bullet item.
    _firstLineAfterParagraphText = _newLineSpace + '* ';

    // For the other line, just indent 2 character so that
    // it align with the paragraph `*` character.
    _nonFirstLineAfterParagraphText = _newLineSpace + '  ';
  }
}
