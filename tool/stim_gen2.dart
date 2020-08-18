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
            name: field,
            type: fieldType,
            getter: CodeReturn.of(fieldRef),
            setter: [
              Container([fieldRef, ' = value;\n']),
              CodeFunctionCall.of(
                name: 'assert',
                args: [Text.of('value != null'), 'value is required'],
              ),
              CodeForEach(
                item: OldCodeExpr.of(iVar),
                collection: OldCodeExpr.of(CodeFunctionCall.of(name: 'eval')),
                body: CodeStatementList.of([
                  Container([
                    CodeRef.ofVar(iVar),
                    '.',
                    fieldRef,
                    ' = value;\n',
                  ]),
                ]),
              ),
            ],
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
      name: name,
      extend: CodeType.genericSingle('expr', name),
      constructors: CodeConstructor.of(
        requiredArgs: 'scope',
        init: CodeFunctionCall.of(name: 'super', args: [
          CodeRef.ofField(scopeField),
        ]),
      ),
      fields: scopeField,
      body: exprFields,
    );
  }

  CodeClass _scopeClass(String name) {
    final exprClassName = CodeClassName.of(name);
    final scopeClassName = CodeClassName.of(name + ' scope');

    final scopeFields = fields?.entries?.map((e) {
      return CodeField.of(
        name: e.key,
        type: e.value + ' scope',
        isFinal: true,
      );
    })?.toList();

    Node makeFields = Join.newLineSeparated(fields?.entries?.map((e) {
      final fieldName = CodeFieldName.of(name: e.key);
      return Container([
        CodeCascade.of(fieldName),
        ' = ',
        fieldName,
        '.none',
      ]);
    })?.toList());

    Node copyFields = Join.newLineSeparated(fields?.entries?.map((e) {
      final fieldName = CodeFieldName.of(name: e.key);
      return Container([
        CodeCascade.of(fieldName),
        ' = ',
        fieldName,
      ]);
    })?.toList());

    final makeFunction = CodeFunction.of(
      name: 'make',
      isOverride: true,
      returns: name,
      body: CodeReturn.of(Container(
        [
          exprClassName,
          '(this)\n',
          Indent(makeFields, level: 2),
        ],
      )),
    );

    var typedArgs = fields?.entries?.map((e) => [e.key, e.value])?.toList();
    final callFunction = CodeFunction.of(
      name: 'call',
      returns: name,
      requiredArgs: typedArgs,
      body: CodeReturn.of(Container(
        [
          'add(this)\n',
          Indent(copyFields, level: 2),
        ],
      )),
    );

    var requiredArgs = fields?.entries?.map((e) => e.key)?.toList();
    return CodeClass.of(
      name: scopeClassName,
      extend: CodeType.genericSingle('scope', name),
      constructors: CodeConstructor.of(requiredArgs: requiredArgs),
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
