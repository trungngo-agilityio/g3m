import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:g3m/g3util.dart';

class Scope implements Node {
  final String name;
  final Map<String, String> fields;
  final String isValidText;

  Scope({
    this.name,
    this.fields,
    this.isValidText,
  });

  @override
  Node build(BuildContext context) {
    final imports =
        fields.entries.map((e) => CodeImport.of(e.key + '.dart')).toList();
    return Container([
      DartCodeFile.of(
        StringFuncs.snake(name),
        package: CodePackage.partOf('dep', path: ['g3m', 'core']),
        classes: [
          _exprClass(name),
          _scopeClass(name),
        ],
      ),
    ]);
  }

  CodeClass _exprClass(String name) {
    final exprFields = fields.entries.map(
      (e) {
        var fieldName = e.key;
        var fieldType = e.value;
        return Container([
          CodeField.of(name: fieldName, type: fieldType, private: true),
          CodeProperty.of(
            name: fieldName,
            type: fieldType,
            getter: CodePropertyGetter.of(body: [
              CodeReturn.of(Pad.left('_', CodeFieldName.of(fieldName))),
            ]),
            setter: CodePropertySetter.of(body: [
              Container(['_', CodeFieldName.of(fieldName), ' = value']),
              CodeFunctionCall.of(
                'assert',
                args: [Text.of('value != null'), 'value is required'],
              ),
              CodeForEach(
                item: CodeExpr.of(CodeVar.of('i', isFinal: true)),
                collection: CodeExpr.of(CodeFunctionCall.of('eval')),
                body: CodeStatementList.of([
                  Container(['i._', fieldName, ' = value;']),
                ]),
              ),
            ]),
          ),
        ]);
      },
    ).toList();

    return CodeClass.of(
      name,
      extend: CodeType.genericSingle('expr', name),
      constructors: [
        CodeClassConstructor.of(
          args: {
            'scope': null,
          },
          init: [
            CodeFunctionCall.of('super', args: [
              Text.of('scope'),
            ]),
          ],
        ),
      ],
      fields: [
        CodeField.of(
            name: 'scope',
            override: true,
            isFinal: true,
            type: name + ' scope'),
      ],
      body: Container([...exprFields]),
    );
  }

  CodeClass _scopeClass(String name) {
    return CodeClass.of(
      name + ' scope',
      extend: CodeType.genericSingle('scope', name),
      functions: [
        CodeFunction.of(
          'make',
          override: true,
          returns: [
            name,
          ],
          body: [
            CodeReturn.of(
                Container([StringFuncs.pascal(name), '(', 'this', ')'])),
          ],
        ),
      ],
    );
  }
}

void main() async {
  final program = SingleChildNode(
    Directory.relative(
      'lib/src/core/api',
      Container([
        Scope(name: 'package', fields: {
          'dependencies': 'dependency',
        }),
        Scope(name: 'dependency', fields: {'version': 'string'}),
      ]),
    ),
  );

  await Program.execute(program);
}
