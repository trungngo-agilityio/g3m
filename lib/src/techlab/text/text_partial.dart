part of g3.techlab;

/// Then internal data structure used by [PartialText]
/// for the parsing of code blocks.
///
class _PartialTextBlock {
  int startPos;
  int endPos;
  int startLineNo;
  int endLineNo;
  String name;
  String content;
}

/// This error handler is called in the case that [PartialText]
/// node face an issue that a code block's end marker could not be found.
///
/// - [isOldContent] means the error is found in the given
/// old content.
/// - [lineNo] is the text line number that the error is found
/// in the input content.
/// - [line] is the full line of text found at [lineNo].
///
/// Returns:
/// - true means the error is accepted and the new content is invalid.
/// Keeps the old content instead and no need human confirmation.
/// - false means the error is not accepted and the new content is valid.
/// Keep merging and no need human confirmation.
/// - null means let's the human decide.
///
typedef PartialTextNotEndedBlockErrorFunc = bool Function(
    bool isOldContent, int lineNo, String line);

/// This error handler is called in the case that [PartialText]
/// node face an issue that there is a code block in either
/// old or new content has duplicated name.
///
/// - [isOldContent] means the error is found in the given
/// old content.
/// - [lineNo] is the text line number that the error is found
/// in the input content.
/// - [line] is the full line of text found at [lineNo].
///
/// Returns:
/// - true means the error is accepted and the new content is invalid.
/// Keeps the old content instead and no need human confirmation.
/// - false means the error is not accepted and the new content is valid.
/// Keep merging and no need human confirmation.
/// - null means let's the human decide.
///
typedef PartialTextDuplicatedNameBlockErrorFunc = bool Function(
    bool isOldContent, int lineNo, String line);

/// This error handler is called in the case that [PartialText]
/// node face an issue that there is a code block in the old content
/// that could not be found in the new content.
///
/// - [startLineNo] is the start text line number that the error is found
/// in the old content.
/// - [endLineNo] is the text line number that the error is found
/// in the old content.
/// - [startLine] is the full text line at the start marker.
/// - [endLine] is the full text line at the end marker.
///
/// Returns:
/// - true means the error is accepted and the new content is invalid.
/// Keeps the old content instead and no need human confirmation.
/// - false means the error is not accepted and the new content is valid.
/// Keep merging and no need human confirmation.
/// - null means let's the human decide.
///
typedef PartialTextOldBlockMissingErrorFunc = bool Function(
    int startLineNo, int endLineNo, String startLine, String endLine);

/// This component help to merge an old text content with a new one via
/// the use of text markers. This is super helpful in code generation
/// in which the generator still allow custom code to be written while
/// regenerating the files.
///
/// Algorithm:
///   - The [startMarker] and [endMarker] help to mark a code block
///   that need to be preserve. Those markers should stand on their
///   own text lines. From the end of a [startMarker] to the end of
///   its line is consider to be the block name. During the re-generation
///   of the whole file (or text block), the engine will looks
///   for code blocks in the old content and preserve it. For any
///   named code block found in the new content, the engine shall
///   replace it with the code block found in the old content if
///   that exists.
/// Exceptions:
///   - If there is a line in either old or new content that have
///   a [startMarker] but the [endMarker] could not be found,
///   the [onNotEndedBlockError] error fires.
///   - If there is a code block in either old or new content
///   has duplicated name then [onDuplicatedNameBlockError] error fires.
///   - If there is a code block in the old content could not be
///   found in the new content, [onMissingOldBlockError] fires.
///   - If the caller of this node fail to address the above issues,
///   the code generation process shall stop.
///
class PartialText implements Node {
  /// The start marker that help figuring out the code blocks that need
  /// to be preserved.
  final String startMarker;

  /// The end marker that helps figuring out the code blocks that need
  /// to be preserved.
  final String endMarker;

  /// The old content. Texts surrounded by the markers will be preserved
  /// after the merged.
  final Node oldContent;

  /// The new content. Texts surrounded by the markers will be replaced
  /// by the old content if that exists.
  final Node newContent;

  /// human readable name for the content. This is useful when display
  /// any error to human.
  final String contentName;

  /// True indicates options shall be presented to user to figure
  /// out what need to be done on error.
  final bool confirmationNeededOnError;

  final PartialTextNotEndedBlockErrorFunc onNotEndedBlockError;

  final PartialTextDuplicatedNameBlockErrorFunc onDuplicatedNameBlockError;

  final PartialTextOldBlockMissingErrorFunc onMissingOldBlockError;

  PartialText({
    @required this.startMarker,
    @required this.endMarker,
    @required this.oldContent,
    @required this.newContent,
    @required this.onNotEndedBlockError,
    @required this.onDuplicatedNameBlockError,
    @required this.onMissingOldBlockError,
    this.contentName,
    this.confirmationNeededOnError,
  })  : assert(startMarker != null, 'start marker pattern is required'),
        assert(endMarker != null, 'end marker pattern is required');

  @override
  Node build(BuildContext context) {
    if (oldContent == null) return newContent;
    return TextMerge(
      children: [
        oldContent,
        newContent,
      ],
      func: (contents) => _merge(context, contents),
    );
  }

  String _merge(BuildContext context, List<String> contents) {
    assert(contents.length == 2, 'bug');
    final oldContent = contents[0];
    final newContent = contents[1];

    // Default error handling strategies for all error is
    // to just report it and quit.

    final reportNotEnded = onNotEndedBlockError ?? _handleNotEndedBlockError;

    final reportDuplicatedNameBlock =
        onDuplicatedNameBlockError ?? _handleDuplicatedNameBlockError;

    final reportMissingOldBlock =
        onMissingOldBlockError ?? _handleMissingOldBlockError;

    final buf = StringBuffer();

    // Parsing the old content and extract partial blocks out.
    var stop = false;
    final oldBlocks = _extractMarkerPositions(
      oldContent,
      onNotEndedError: (int lineNo, String line) {
        stop = reportNotEnded(true, lineNo, line);

        if (stop == null && confirmationNeededOnError == true) {
          stop = checkAbort(context);
        }
        return stop;
      },
      onDuplicatedNameError: (int lineNo, String line) {
        stop = reportDuplicatedNameBlock(true, lineNo, line);
        if (stop == null && confirmationNeededOnError == true) {
          stop = checkAbort(context);
        }
        return stop;
      },
    );

    if (stop != false) {
      // just return the old content.
      return oldContent;
    }

    // Parsing the new content and extract partial blocks out.
    final newBlocks = _extractMarkerPositions(
      newContent,
      onNotEndedError: (int lineNo, String line) {
        stop = reportNotEnded(false, lineNo, line);
        if (stop == null && confirmationNeededOnError == true) {
          stop = checkAbort(context);
        }
        return stop;
      },
      onDuplicatedNameError: (int lineNo, String line) {
        stop = reportDuplicatedNameBlock(false, lineNo, line);
        if (stop == null && confirmationNeededOnError == true) {
          stop = checkAbort(context);
        }
        return stop;
      },
    );

    if (stop != false) {
      // just return the old content.
      return oldContent;
    }

    // Builds up the final result.
    var k = 0;
    for (final newBlock in newBlocks.values) {
      assert(
        newBlock.startPos >= k,
        'bug, the list of blocks should be sorted',
      );

      if (k < newBlock.startPos) {
        // Needs to dump the content from the current position to the start
        // of the new block to output.
        buf.write(newContent.substring(k, newBlock.startPos));
      }

      var blockContent = newBlock.content;
      // Try to looks for the old block
      final oldBlock = oldBlocks[newBlock.name];
      if (oldBlock != null) {
        // found the old block for it.
        blockContent = oldBlock.content;

        // remove the old content so that we can come back and check
        // if any old block can not be mapped.
        oldBlock.content = null;
      }

      // write out the block content.
      buf.write(blockContent);

      // Move to the end of the block and content mapping.
      k = newBlock.endPos;
    }

    if (k < newContent.length) {
      // write the rest from new content out
      buf.write(newContent.substring(k));
    }

    // Checks if any old text blocks could not be found in the new one.
    for (final i in oldBlocks.values) {
      if (i.content != null) {
        final startLine = _getLineAtPos(i.startPos, oldContent);
        final endLine = _getLineAtPos(i.endPos, oldContent);
        stop = reportMissingOldBlock(
            i.startLineNo, i.endLineNo, startLine, endLine);
        // Just ignore the merge result and return the old content
        if (stop == null && confirmationNeededOnError == true) {
          stop = checkAbort(context);
        }
        if (stop != false) {
          return oldContent;
        }
      }
    }

    return buf.toString();
  }

  /// a text content, this function scans through the text and try
  /// to extract the interesting text blocks that start and end
  /// with the marker pattern. Notes that, from the start marker to
  /// the end of the same line, that is considered the block's name.
  ///
  Map<String, _PartialTextBlock> _extractMarkerPositions(
    String content, {
    bool Function(int lineNo, String line) onNotEndedError,
    bool Function(int lineNo, String line) onDuplicatedNameError,
  }) {
    final blocks = <String, _PartialTextBlock>{};
    var k = 0;
    while (true) {
      // Looks for the start marker from the current position.
      k = content.indexOf(startMarker, k);
      if (k < 0) {
        // no start marker is found, finish the scanning.
        return blocks;
      }

      // Creates a new block and only add that to final result
      // once the full block is parsed.
      var block = _PartialTextBlock();

      // This is the beginning of the block, including the start marker.
      block.startPos = k;

      // This is the text line number where the start marker is found
      // this is great for error reporting.
      block.startLineNo = _lineNoOf(block.startPos, content);

      // try to get to the end of the block to figure out the new line
      k += startMarker.length;
      k = content.indexOf('\n', k);

      if (k < 0) {
        // could not find the end of line. so this is the last line of
        // the text.
        k = content.length;
      }

      // extracts the block name out of the current line text.
      final line = content.substring(block.startPos, k);
      block.name = line.substring(startMarker.length).paramCase.toLowerCase();

      // Search for the end marker
      k = content.indexOf(endMarker, k + 1);

      if (k < 0) {
        final errorLine = _getLineAtPos(block.startPos, content);
        // reach the end of the content.
        // the end marker will not be found. report error.
        // Figure out the line number of the start marker.
        // Reports the error to caller. If caller return true
        // then the error is accepted and the parsing should be stopped.
        // Otherwise, if the caller return false, the parsing should stop
        // and the unfinished block just be ignored.
        var stop = onNotEndedError(block.startLineNo, errorLine);
        if (stop != false) {
          return null;
        } else {
          // ignore this marker and continue parsing
          continue;
        }
      }

      // a new block recognized.
      block.endPos = k + endMarker.length;

      // The text line number of where the end marker is found.
      block.endLineNo = _lineNoOf(block.endPos, content);

      // The full block content, include the start and end marker.
      block.content = content.substring(block.startPos, block.endPos);

      // Adds the recognized block to the final result.
      if (blocks.containsKey(block.name)) {
        final errorLine = _getLineAtPos(block.startPos, content);
        // ignore this block
        var stop = onDuplicatedNameError(block.startLineNo, errorLine);
        if (stop != false) {
          return null;
        }

        // do ignore the current block
      } else {
        blocks[block.name] = block;
      }
      k = block.endPos;
    }
  }

  String _getLineAtPos(int pos, String content) {
    var start = content.lastIndexOf('\n', pos);
    if (start < 0) {
      start = 0;
    } else {
      start++;
    }

    var end = content.indexOf('\n', pos + 1);
    if (end < 0) end = content.length;

    return content.substring(start, end);
  }

  /// Givens a position in a text content.
  /// Figure out what line number is it.
  static int _lineNoOf(int pos, String content) {
    var lineNo = 0;
    var k = 0;

// Keeps look for the new line character until hitting
// a position that is bigger than the input.
    do {
      lineNo++;
      k = content.indexOf('\n', k + 1);
    } while (k >= 0 && k < pos);
    return lineNo;
  }

  String _getContentName(bool isOldContent) {
    var s = isOldContent ? 'old ' : 'new ';
    return s + (contentName?.isNotEmpty == true ? contentName : 'content');
  }

  bool _handleNotEndedBlockError(bool isOldContent, int lineNo, String line) {
    final s = _getContentName(isOldContent);
    print(
      'Partial text failed. In the $s content, found a block that is not ended.'
      '  [$lineNo]: $line\n',
    );
    return null;
  }

  bool _handleDuplicatedNameBlockError(
      bool isOldContent, int lineNo, String line) {
    final s = _getContentName(isOldContent);
    print(
      'Partial text failed. In the $s content, found a block with duplicated '
      'code name. \n'
      '  [$lineNo]: $line\n',
    );
    return null;
  }

  bool _handleMissingOldBlockError(
      int startLineNo, int endLineNo, String startLine, String endLine) {
    final s = _getContentName(true);
    print(
      'Partial text failed. In the $s, found a block that does not '
      'exist in the new content.\n'
      '  [$startLineNo]: $startLine\n'
      '  ...\n'
      '  [$endLineNo]: $endLine\n',
    );
    return null;
  }

  bool checkAbort(BuildContext context) {
    final abort = 'Abort';
    final skip = 'Skip generating this file and i will fix the issue later.';

    final overwrite = 'Overwrite, ignore the issue.';
    // The content has been modified. Need to prompt.
    final options = {
      'a': abort,
      's': skip,
      'o': overwrite,
    };

    final message = 'Choose?';

    // Prompt user to see what they want to do with the file.
    final choice = prompts.choose(
      message,
      options.values,
      defaultsTo: abort,
      names: options.keys,
    );

    if (choice == abort) {
      // Abort rendering.
      context.abort();
      return true;
    } else if (choice == skip) {
      final s = _getContentName(false);
      // Skips the file.
      print('The $s has been skipped.');
      return true;
    } else {
      final s = _getContentName(false);
      // Skips the file.
      print('Issue ignored. The $s need to be checked manual later.');
      return false;
    }
  }
}
