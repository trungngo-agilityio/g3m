import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:g3m/g3m.dart';
import 'package:g3m/g3mex.dart';

final w = WorldEx();
Set<DataType> nativeTypes;

bool isNativeType(DataType type) {
  return nativeTypes.contains(type);
}

void main() {
  // Cache the existing types before adding anything new in.
  nativeTypes = w.type.all.eval();

  final m = w.model, f = w.field, t = w.type;

  // Special fields
  final packageField = f('package', t.string);
  final author = f('author', t('author'));

  // To be generated models
  final packageModel = m('package')
    ..fields = f.desc + f.version + packageField + author;

  final authorModel = m('author')
    ..fields = f.firstName + f.middleName + f.lastName + f.email;

  final dependencyModel = m('dependency')..fields = f.version + f.desc;

  // This is the list of all models to be generated.
  final models = authorModel + packageModel + dependencyModel;
  _generateModels(models);
}

void _generateModels(Model models) {
  final dartPackageName = 'generated';
  final dartPackagePath = ['g3m', 'tool'];
  final dartPackage = CodePackage.of(dartPackageName, path: dartPackagePath);

  final dartPackagePartOf =
      CodePackage.partOf(dartPackageName, path: dartPackagePath);

  final modelCodes = models.eval().map((model) {
    final definitions = model
        .eval()
        .map((e) => ExprDefinitionCode(dartPackagePartOf, model))
        .toList();
    return Container(definitions);
  }).toList();

  Node program = SingleChildNode(
    Directory.relative(
      'tool/src/generated',
      Container([
        // For each model, generate an expression and scope definition file.
        Container(modelCodes),

        // Generates a world.dart definition files that provides a quick way
        // to instantiate all scope.
        WorldCode(dartPackagePartOf, models),
        // Generate a lib.dart file that include all other model definitions.
        LibCode(dartPackage, models),
      ]),
    ),
  );

  program = _buildGRpcTypeMapping(program);
  Program.execute(program);
}

class WorldCode implements Node {
  final CodePackage dartPackagePartOf;
  final Model models;

  WorldCode(this.dartPackagePartOf, this.models);

  @override
  Node build(BuildContext context) {
    return DartCodeFile.of(
      'world',
      package: dartPackagePartOf,
      classes: [
        CodeClass.of(
          name: 'tool world',
          fields: _makeFields(),
          properties: _makeProperties(),
          constructors: _makeDefaultConstructor(),
        ),
      ],
    );
  }

  List<CodeField> _makeFields() {
    return models
        .eval()
        .map((e) => CodeField.of(
              name: e.name,
              type: e.name + ' scope',
              isPrivate: true,
            ))
        .toList();
  }

  List<CodeProperty> _makeProperties() {
    return models.eval().map((e) {
      return CodeProperty.of(
        name: e.name,
        type: e.name + ' scope',
        getter: 'return _${e.name.camel()};',
      );
    }).toList();
  }

  Node _makeDefaultConstructor() {
    final body = models.eval().map((e) {
      var fieldName = e.name.camel();
      var scopeClassName = e.name.pascal() + 'Scope';

      return '_${fieldName} = ${scopeClassName.pascal()}(this);\n';
    }).toList();
    return CodeConstructor.of(body: Container(body));
  }
}

Node _buildGRpcTypeMapping(Node child) {
  final t = w.type;
  return CodeTypeNameMapperConfig(child, {
    t.uint32.name.toString(): 'int',
  });
}

class LibCode implements Node {
  final CodePackage dartPackage;
  final Model models;

  LibCode(this.dartPackage, this.models);

  @override
  Node build(BuildContext context) {
    final content = Container(
      models.eval().map((e) {
        // Generates a part of statement.
        return Text.of("part '${e.name}.dart';\n");
      }).toList(),
    );

    return DartCodeFile.of(
      'lib',
      package: dartPackage,
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

class ExprDefinitionCode implements Node {
  final CodePackage dartPackage;
  final Model model;

  String fileName;
  String name;
  Set<Field> allFields;
  Set<Field> exprFields;

  ExprDefinitionCode(this.dartPackage, this.model) {
    fileName = model.name.snake().toString();
    name = model.name.toString();
    allFields = model.fields.eval();
    exprFields = allFields.where((e) => !isNativeType(e.type)).toSet();
  }

  @override
  Node build(BuildContext context) {
    return DartCodeFile.of(
      fileName,
      package: dartPackage,
      classes: [
        _exprClass(),
        _scopeClass(),
      ],
    );
  }

  Node _exprClass() {
    final exprFields = allFields.map(
      (e) {
        var fieldName = e.name.toString();
        var fieldType = e.type.name.toString();

        var field =
            CodeField.of(name: fieldName, type: fieldType, isPrivate: true);
        var fieldRef = CodeRef.of(field);

        var iVar = CodeVar.of(name: 'i', isFinal: true);
        var iVarRef = CodeRef.of(iVar);

        var valueRef = Text.of('value');
        return Container([
          field,
          CodeProperty.of(
            name: field,
            type: fieldType,
            getter: CodeReturn.of(fieldRef),
            setter: [
              // _author = value;
              CodeAssignExpr.of(fieldRef, valueRef),

              isNativeType(e.type)
                  ? null

                  // assert(value != null, 'value is required')
                  : CodeFunctionCall.of(
                      name: 'assert',
                      args: [
                        CodeNotEqualExpr.of(valueRef, CodeNullLiteral()),
                        'value is required'
                      ],
                    ),

              // for (var i in eval()) {
              CodeForEach.of(
                item: iVar,
                collection: CodeFunctionCall.of(name: 'eval'),
                body: Container([
                  // i._author = value;
                  CodeAssignExpr.of(
                    CodeAccessExpr.of(iVarRef, fieldRef),
                    valueRef,
                  ),
                ]),
              ),
            ],
          ),
        ]);
      },
    ).toList();

    final worldField = _makeWorldField();
    final className = CodeClassName.of(name);
    final scopeField = CodeFieldName.of(name: className);

    // class Package extends Expr<Package>
    return CodeClass.of(
        name: className,
        extend: CodeType.genericSingle('expr', name),

        // Package(this.world):
        //    super(world.package);
        constructors: CodeConstructor.of(
          requiredArgs: worldField,
          init: CodeFunctionCall.of(name: 'super', args: [
            Container(['world.', scopeField]),
          ]),
        ),
        fields: worldField,
        body: [
          ...exprFields,
          CodeCustom(
            CodeComment.of('implement custom code here'),
          ),
        ]);
  }

  CodeField _makeWorldField() {
    return CodeField.of(
      name: 'world',
      isFinal: true,
      type: 'tool world',
    );
  }

  CodeClass _scopeClass() {
    final exprClassName = CodeClassName.of(name);
    final scopeClassName = CodeClassName.of(name + ' scope');

    final worldField = _makeWorldField();

    Node makeFields = Join.newLineSeparated(exprFields.map((e) {
      final fieldName = CodeFieldName.of(name: e.name);
      return Container([
        CodeCascade.of(fieldName),
        ' = world.',
        fieldName,
        '.none',
      ]);
    })?.toList());

    Node copyFields = Join.newLineSeparated(allFields.map((e) {
      final fieldName = CodeFieldName.of(name: e.name);
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
          '(',
          worldField.name,
          ')\n',
          Indent(makeFields, level: 2),
        ],
      )),
    );

    var typedArgs = allFields.map((e) => [e.name, e.type])?.toList();
    final callFunction = CodeFunction.of(
      name: 'call',
      returns: name,
      namedArgs: typedArgs,
      body: CodeReturn.of(Container(
        [
          'add(null)\n',
          Indent(copyFields, level: 2),
        ],
      )),
    );

    return CodeClass.of(
      name: scopeClassName,
      extend: CodeType.genericSingle('scope', name),
      constructors: CodeConstructor.of(requiredArgs: worldField),
      fields: worldField,
      functions: [
        makeFunction,
        callFunction,
      ],
    );
  }
}
