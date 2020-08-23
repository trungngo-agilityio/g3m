import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_dart.dart';
import 'package:g3m/g3util.dart';

void main() {
  final files = [
    _generate('equalOp'),
    _generate('notEqualOp'),
    _generate('greaterThanOp'),
    _generate('greaterThanOrEqualOp'),
    _generate('lessThanOp'),
    _generate('lessThanOrEqualOp'),

// Type test operators
    _generate('asOp'),
    _generate('isOp'),
    _generate('isNotOp'),

// Arithmetic operator
    _generate('plusOp'),
    _generate('minusOp'),
    _generate('multiplyOp'),
    _generate('divideOp'),
    _generate('divOp'),
    _generate('modOp'),

// Bitwise and shift operators
    _generate('bitShiftLeftOp'),
    _generate('bitShiftRightOp'),
    _generate('bitAndOp'),
    _generate('bitOrOp'),
    _generate('bitXorOp'),
    _generate('bitNegateOp'),

// Assignment operators
    _generate('assignOp'),
    _generate('assignIfNullOp'),
    _generate('plusAssignOp'),
    _generate('minusAssignOp'),
    _generate('multiplyAssignOp'),
    _generate('divideAssignOp'),
    _generate('modAssignOp'),
    _generate('bitShiftLeftAssignOp'),
    _generate('bitShiftRightAssignOp'),
    _generate('bitAndAssignOp'),
    _generate('bitOrAssignOp'),
    _generate('bitXorAssignOp'),
    _generate('bitNegateAssignOp'),

// Logical operators
    _generate('logicalNotOp'),
    _generate('logicalAndOp'),
    _generate('logicalOrOp'),

// Conditional operators
    _generate('conditionalOp'),
    _generate('conditionalNullOp'),

// Access or call operators
    _generate('accessOp'),
    _generate('cascadeOp'),
    _generate('conditionalAccessOp'),
    _generate('listAccessOp'),
    _generate('functionCallOp'),
    _generate('groupOp'),
  ];

  Program.execute(DartCode.of(body: Container(files)));
}

Node _generate(String name) {
  name = StringFuncs.title(name.substring(0, name.length - 2));
  var className = CodeClassName.of('code ' + name + ' expr');

  var runFunc = CodeFunctionCall.of(name: 'run', args: [
    Container([
      className,
      Text.of('.of(\'a\', \'b\')\n'),
    ]),
    Text.of('\'"a" && "b"\',\n'),
  ]);

  return Container([
    'test(\'',
    className,
    '\',',
    ' () {\n',
    runFunc,
    '\n',
    '});\n',
  ]);
}

Node _generateClass(String name) {
  var className = StringFuncs.title(name.substring(0, name.length - 2));
  className = 'code ' + className + ' expr';
  final constructor = CodeConstructor.of(
    name: 'of',
    init: CodeFunctionCall.of(name: 'super', args: [
      Text.of(
          'CodeExpr.open(CodeExprList.of(op: CodeOps.${name}, expr1: e1, expr2: e2,),)'),
    ]),
    requiredArgs: [
      CodeArg.of(name: 'e1', type: 'dynamic'),
      CodeArg.of(name: 'e2', type: 'dynamic'),
    ],
  );
  return CodeClass.of(
    name: className,
    extend: 'single child node',
    constructors: constructor,
  );
}
