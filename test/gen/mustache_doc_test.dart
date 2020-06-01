import 'dart:io';

import 'package:g3m/g3gen.dart';
import 'package:test/test.dart';

class Data {
  final String name;

  Data(this.name);
}

void main() {
  test('name', () {
    final template = 'Hello {{name}}!';
    final doc = MustacheDoc.of(
      template,
      Data('John Smith'),
    );
    doc.write(stdout);
  });
}
