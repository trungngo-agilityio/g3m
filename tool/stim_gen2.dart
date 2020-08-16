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
        var field =
            CodeField.of(name: fieldName, type: fieldType, private: true);
        var fieldRef = CodeRef.ofField(field);

        var iVar = CodeVar.of('i', isFinal: true);
        return Container([
          field,
          CodeProperty.of(
            name: fieldName,
            type: fieldType,
            getter: CodePropertyGetter.of(body: [
              CodeReturn.of(fieldRef),
            ]),
            setter: CodePropertySetter.of(body: [
              Container([fieldRef, ' = value']),
              CodeFunctionCall.of(
                'assert',
                args: [Text.of('value != null'), 'value is required'],
              ),
              CodeForEach(
                item: CodeExpr.of(iVar),
                collection: CodeExpr.of(CodeFunctionCall.of('eval')),
                body: CodeStatementList.of([
                  Container([CodeRef.ofVar(iVar), '.', fieldRef, ' = value']),
                ]),
              ),
            ]),
          ),
        ]);
      },
    ).toList();

    final scopeField = CodeField.of(
      name: 'scope',
      override: true,
      isFinal: true,
      type: name + ' scope',
    );

    return CodeClass.of(
      name,
      extend: CodeType.genericSingle('expr', name),
      constructors: [
        CodeClassConstructor.of(
          args: {'scope': null},
          init: [
            CodeFunctionCall.of('super', args: [
              CodeRef.ofField(scopeField),
            ]),
          ],
        ),
      ],
      fields: [
        scopeField,
      ],
      body: Container([...exprFields]),
    );
  }

  CodeClass _scopeClass(String name) {
    final scopeFields = fields?.entries?.map((e) {
      return CodeField.of(
        name: e.key,
        type: e.value + ' scope',
        isFinal: true,
      );
    })?.toList();

    Node makeFields = Join.newLineSeparated(fields?.entries?.map((e) {
      final fieldName = CodeFieldName.of(e.key);
      return Container([
        CodeCascade.of(fieldName),
        ' = ',
        fieldName,
        '.none',
      ]);
    })?.toList());

    Node copyFields = Join.newLineSeparated(fields?.entries?.map((e) {
      final fieldName = CodeFieldName.of(e.key);
      return Container([
        CodeCascade.of(fieldName),
        ' = ',
        fieldName,
      ]);
    })?.toList());

    final makeFunction = CodeFunction.of(
      'make',
      override: true,
      returns: [
        name,
      ],
      body: [
        CodeReturn.of(Container(
          [
            StringFuncs.pascal(name),
            '(',
            'this',
            ')',
            '\n',
            Indent(makeFields, level: 2),
          ],
        )),
      ],
    );

    final callFunction = CodeFunction.of(
      'call',
      returns: [name],
      args: fields,
      body: [
        CodeReturn.of(Container(
          [
            'add(',
            'this',
            ')',
            '\n',
            Indent(copyFields, level: 2),
          ],
        )),
      ],
    );

    return CodeClass.of(
      name + ' scope',
      extend: CodeType.genericSingle('scope', name),
      constructors: [
        CodeClassConstructor.of(
            args: fields?.map((key, value) => MapEntry(key, null))),
      ],
      fields: scopeFields,
      functions: [
        makeFunction,
        callFunction,
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
          'sub dep': 'dependency',
          'authors': 'author',
        }),
        Scope(name: 'dependency', fields: {'version': 'dependency'}),
        Scope(name: 'author', fields: {'author': 'dependency'}),
      ]),
    ),
  );

  await Program.execute(program);
}
