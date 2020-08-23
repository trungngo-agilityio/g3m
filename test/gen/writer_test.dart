import 'dart:io';

import 'package:g3m/gen.dart';
import 'package:test/test.dart';

void main() {
  test('name', () {
    var w = Writer(stdout);
    w.writeln('# Header 1');
    w.writeln('This is a markdown demo.');
    w.tab();

    w.write('* ');
    w.write('item 1');
    w.writeln();

    w ^ mk.h1 % 'Markdown header 1';
    w ^ mk.h2 % 'Markdown header 2';
    w ^ mk.h3 % 'Markdown header 3';

    // Demo writer operators
    String s;
    w >> camel % s; // null demo
    w ^ upper % 'upper case demo';
    w ^ lower % 'lower case demo';
    w ^ pascal % 'pascal case demo';
    w ^ camel % 'camel case demo';
    w ^ dot % 'dot case demo';
    w ^ path % 'path case demo';
    w ^ param % 'param case demo';
    w ^ header % 'header case demo';
    w ^ title % 'title case demo';
    w ^ constant % 'constant case demo';
    w ^ norm % '    norm   demo     ';
    w ^ quote % 'quote\' demo';
    w ^ doubleQuote % 'double\" quote demo';
    w << '';

    w ^ upper % '* item 2';
    w ^ title % '* item 3. hello title' + sentence % '. Just a test' * 3;

    // Makes 3 new lines and the untab.
    ~~~w << '';

    w.writeln('End of mark down demo.');
  });
}
