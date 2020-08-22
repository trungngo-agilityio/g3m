part of g3.armory.stimpack;

class StimpackLibFile implements Node {
  StimpackDialect _dialect;

  StimpackLibFile();

  @override
  Node build(BuildContext context) {
    _dialect = context.dependOnAncestorNodeOfExactType<StimpackDialect>();

    final content = Container(
      _dialect.models.map((e) {
        // Generates a part of statement.
        return Text.of("part '${e.name}.dart';\n");
      }).toList(),
    );

    return DartCodeFile.of(
      'lib',
      package: _dialect.codePackage(),
      body: Mustache.template('''
import 'package:g3m/g3m.dart';

part 'world.dart';
{{{content}}}
      ''', values: {
        'content': content,
      }),
    );
  }
}
