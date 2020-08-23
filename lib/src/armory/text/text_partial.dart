part of g3.armory;

class _PartialTextBlock {
  int startPos;
  int endPos;
  int startLineNo;
  int endLineNo;
  String name;
  String content;
}

typedef PartialTextNotEndedBlockErrorFunc = bool Function(
    bool isOldContent, int lineNo, String line);

typedef PartialTextDuplicatedNameBlockErrorFunc = bool Function(
    bool isOldContent, int lineNo, String line);

typedef PartialTextOldBlockMissingErrorFunc = bool Function(
    int startLineNo, int endLineNo, String content);

class PartialText implements Node {
  final String startMarker;
  final String endMarker;

  final Node oldContent;
  final Node newContent;

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

    // reportNotEndedError handling function
    final reportNotEndedError = onNotEndedBlockError ??
        (isOldContent, lineNo, line) {
          return true;
        };

    final reportDuplicatedNameBlockError = onDuplicatedNameBlockError ??
        (isOldContent, lineNo, line) {
          return true;
        };

    final reportMissingOldBlock = onMissingOldBlockError ??
        (startLineNo, endLineNo, content) {
          return true;
        };

    final buf = StringBuffer();

    // Parsing the old content and extract partial blocks out.
    var stop = false;
    final oldBlocks =
        _extractMarkerPositions(oldContent, onNotEndedError: (lineNo, line) {
      stop = reportNotEndedError(true, lineNo, line);
      return stop;
    }, onDuplicatedNameError: (lineNo, line) {
      stop = reportDuplicatedNameBlockError(true, lineNo, line);
      return stop;
    });

    if (stop || oldBlocks?.isNotEmpty != true) {
      // just return the old content.
      return newContent;
    }

    // Parsing the new content and extract partial blocks out.
    final newBlocks =
        _extractMarkerPositions(newContent, onNotEndedError: (lineNo, line) {
      stop = reportNotEndedError(false, lineNo, line);
      return stop;
    }, onDuplicatedNameError: (lineNo, line) {
      stop = reportDuplicatedNameBlockError(false, lineNo, line);
      return stop;
    });

    if (stop) {
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
        if (reportMissingOldBlock(i.startLineNo, i.endLineNo, i.content)) {
          // Just ignore the merge result and return the old content
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
        // reach the end of the content.
        // the end marker will not be found. report error.
        // Figure out the line number of the start marker.
        // Reports the error to caller. If caller return true
        // then the error is accepted and the parsing should be stopped.
        // Otherwise, if the caller return false, the parsing should stop
        // and the unfinished block just be ignored.
        if (onNotEndedError(block.startLineNo, line)) return null;
      }

      // a new block recognized.
      block.endPos = k + endMarker.length;

      // The text line number of where the end marker is found.
      block.endLineNo = _lineNoOf(block.endPos, content);

      // The full block content, include the start and end marker.
      block.content = content.substring(block.startPos, block.endPos);

      // Adds the recognized block to the final result.
      if (blocks.containsKey(block.name)) {
        // ignore this block
        onDuplicatedNameError(block.startLineNo, line);
      } else {
        blocks[block.name] = block;
      }
      k = block.endPos;
    }
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

  void checkAbort(BuildContext context, String path) {
    final relativePath = ioPath.relative(path);

    // The content has been modified. Need to prompt.
    final abort = 'Yes. abort';
    final skip =
        'No, skip generating this file and i will fix the issue later.';
    final options = {
      'y': abort,
      'n': skip,
    };

    final message =
        '$relativePath file has invalid custom code marker without an end.'
        ' Do you want to abort?';

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
    } else {
      // Skips the file.
      print('$relativePath has been skipped.');
    }
  }
}
