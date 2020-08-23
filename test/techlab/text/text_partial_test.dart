import 'package:g3m/g3techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  final start = '###';
  final end = '###';

  group('success', () {
    test('null & empty', () {
      for (final i in [null, Text.of(''), Text.of('to be overwritten')]) {
        for (final j in [null, Text.of('')]) {
          var node = PartialText(
            startMarker: start,
            endMarker: end,
            oldContent: i,
            newContent: j,
            onMissingOldBlockError: failOnMissingOldBlockError,
            onNotEndedBlockError: failOnNotEndedBlockError,
            onDuplicatedNameBlockError: failOnDuplicatedNameBlockError,
          );
          runAndExpect(node, '');
        }
      }
    });

    test('all', () {
      var text1 = Text.of('hello \n'
          '$start name \n'
          'john! \n'
          '$end\n'
          'I am tim.\n'
          '$start message\n'
          'Great to meet you.'
          '$end');
      var text2 = Text.of(
        'bye \n'
        '$start name \n'
        'tim \n'
        '$end'
        'I am not tim.\n'
        '$start message \n'
        'See you soon.'
        '$end',
      );
      var node = PartialText(
        startMarker: start,
        endMarker: end,
        oldContent: text1,
        newContent: text2,
        onMissingOldBlockError: failOnMissingOldBlockError,
        onNotEndedBlockError: failOnNotEndedBlockError,
        onDuplicatedNameBlockError: failOnDuplicatedNameBlockError,
      );
      runAndExpect(
          node,
          'bye \n'
          '### name \n'
          'john! \n'
          '###I am not tim.\n'
          '### message\n'
          'Great to meet you.###');
    });
  });

  group('missing block error', () {
    test('not ended old content', () {
      for (final i in [
        '$start name\n',
      ]) {
        var reported = false;
        var node = PartialText(
          startMarker: start,
          endMarker: end,
          oldContent: Text.of(i),
          newContent: Text.of('new content'),
          onMissingOldBlockError: failOnMissingOldBlockError,
          onNotEndedBlockError: (isOldContent, lineNo, line) {
            expect(isOldContent, true);
            reported = true;
            return true;
          },
          onDuplicatedNameBlockError: failOnDuplicatedNameBlockError,
        );
        runAndExpect(node, null);
        expect(reported, true);
      }
    });

    test('not ended new content', () {
      for (final i in [
        '$start name\n',
      ]) {
        var reported = false;
        var node = PartialText(
          startMarker: start,
          endMarker: end,
          oldContent: Text.of('old content'),
          newContent: Text.of(i),
          onMissingOldBlockError: failOnMissingOldBlockError,
          onNotEndedBlockError: (isOldContent, lineNo, line) {
            expect(isOldContent, false);
            reported = true;
            return true;
          },
          onDuplicatedNameBlockError: failOnDuplicatedNameBlockError,
        );
        runAndExpect(node, null);
        expect(reported, true);
      }
    });
  });

  group('duplicated name error', () {
    test('in old content', () {
      for (final i in [
        '$start name\n'
            '$end name\n'
            'hello'
            '$start name\n'
            '$end name\n',
      ]) {
        var reported = false;
        var node = PartialText(
          startMarker: start,
          endMarker: end,
          oldContent: Text.of(i),
          newContent: Text.of('new content'),
          onMissingOldBlockError: failOnMissingOldBlockError,
          onNotEndedBlockError: failOnNotEndedBlockError,
          onDuplicatedNameBlockError: (isOldContent, lineNo, line) {
            expect(isOldContent, true);
            reported = true;
            return true;
          },
        );
        runAndExpect(node, null);
        expect(reported, true);
      }
    });

    test('new block', () {
      for (final i in [
        '$start name\n'
            '$end name\n'
            'hello'
            '$start name\n'
            '$end name\n',
      ]) {
        var reported = false;
        var node = PartialText(
          startMarker: start,
          endMarker: end,
          oldContent: Text.of('old content'),
          newContent: Text.of(i),
          onMissingOldBlockError: failOnMissingOldBlockError,
          onNotEndedBlockError: failOnNotEndedBlockError,
          onDuplicatedNameBlockError: (isOldContent, lineNo, line) {
            expect(isOldContent, false);
            reported = true;
            return true;
          },
        );
        runAndExpect(node, null);
        expect(reported, true);
      }
    });
  });

  group('missing old block', () {
    test('in old content', () {
      for (final i in [
        '$start name\n'
            'content'
            '$end name\n'
      ]) {
        var reported = false;
        var node = PartialText(
          startMarker: start,
          endMarker: end,
          oldContent: Text.of(i),
          newContent: Text.of('new content'),
          onMissingOldBlockError: (startLineNo, endLineNo, startLine, endLine) {
            reported = true;
            return true;
          },
          onNotEndedBlockError: failOnNotEndedBlockError,
          onDuplicatedNameBlockError: failOnDuplicatedNameBlockError,
        );
        runAndExpect(node, null);
        expect(reported, true);
      }
    });
  });
}

bool failOnMissingOldBlockError(
    int startLineNo, int endLineNo, String startLine, String endLine) {
  fail('should not get here');
}

bool failOnNotEndedBlockError(bool isOldContent, int lineNo, String line) {
  fail('should not get here');
}

bool failOnDuplicatedNameBlockError(
    bool isOldContent, int lineNo, String line) {
  fail('should not get here');
}
