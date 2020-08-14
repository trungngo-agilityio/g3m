library g3.armory;

import 'dart:io' as io;

import 'package:g3m/g3gen.dart';
import 'package:meta/meta.dart';
import 'package:mustache/mustache.dart';
import 'package:path/path.dart' as ioPath;

part 'src/armory/code/core/access.dart';

part 'src/armory/code/core/annotation/annotation-name.dart';

part 'src/armory/code/core/annotation/annotation.dart';
part 'src/armory/code/core/annotation/annotation-list.dart';

part 'src/armory/code/core/block.dart';

part 'src/armory/code/core/class/class-constructor-list.dart';

part 'src/armory/code/core/class/class-constructor-name.dart';

part 'src/armory/code/core/class/class-constructor.dart';

part 'src/armory/code/core/class/class-list.dart';

part 'src/armory/code/core/class/class-name.dart';

part 'src/armory/code/core/class/class-property.dart';

part 'src/armory/code/core/class/class.dart';

part 'src/armory/code/core/comment.dart';

part 'src/armory/code/core/config.dart';

part 'src/armory/code/core/field/field-list.dart';

part 'src/armory/code/core/field/field-name.dart';

part 'src/armory/code/core/field/field.dart';

part 'src/armory/code/core/file.dart';

part 'src/armory/code/core/function/function-arg-list.dart';

part 'src/armory/code/core/function/function-arg-name.dart';

part 'src/armory/code/core/function/function-arg.dart';

part 'src/armory/code/core/function/function-list.dart';

part 'src/armory/code/core/function/function-name.dart';

part 'src/armory/code/core/function/function-return-list.dart';

part 'src/armory/code/core/function/function-return.dart';

part 'src/armory/code/core/function/function-throw-list.dart';

part 'src/armory/code/core/function/function-throw.dart';

part 'src/armory/code/core/function/function.dart';

part 'src/armory/code/core/generic/generic-param-list.dart';

part 'src/armory/code/core/generic/generic-param.dart';

part 'src/armory/code/core/import/import-list.dart';

part 'src/armory/code/core/import/import-type.dart';

part 'src/armory/code/core/import/import.dart';

part 'src/armory/code/core/interface/interface-list.dart';

part 'src/armory/code/core/interface/interface.dart';

part 'src/armory/code/core/package/package-name.dart';

part 'src/armory/code/core/package/package.dart';

part 'src/armory/code/core/space.dart';

part 'src/armory/code/core/statement/break.dart';

part 'src/armory/code/core/statement/case.dart';

part 'src/armory/code/core/statement/continue.dart';

part 'src/armory/code/core/statement/else-if.dart';

part 'src/armory/code/core/statement/expr.dart';

part 'src/armory/code/core/statement/expr/await.dart';
part 'src/armory/code/core/statement/expr/function-call.dart';

part 'src/armory/code/core/statement/expr/literal/array-literal.dart';

part 'src/armory/code/core/statement/expr/literal/boolean-literal.dart';

part 'src/armory/code/core/statement/expr/literal/char-literal.dart';

part 'src/armory/code/core/statement/expr/literal/list-literal.dart';

part 'src/armory/code/core/statement/expr/literal/map-literal.dart';

part 'src/armory/code/core/statement/expr/literal/null-literal.dart';

part 'src/armory/code/core/statement/expr/literal/numeric-literal.dart';

part 'src/armory/code/core/statement/expr/literal/string-literal.dart';

part 'src/armory/code/core/statement/for-each.dart';

part 'src/armory/code/core/statement/for.dart';

part 'src/armory/code/core/statement/if.dart';

part 'src/armory/code/core/statement/repeat.dart';

part 'src/armory/code/core/statement/return.dart';

part 'src/armory/code/core/statement/statement-list.dart';

part 'src/armory/code/core/statement/statement.dart';

part 'src/armory/code/core/statement/var-name.dart';

part 'src/armory/code/core/statement/var.dart';

part 'src/armory/code/core/statement/while.dart';

part 'src/armory/code/core/syntax.dart';

part 'src/armory/code/core/type/type-list.dart';

part 'src/armory/code/core/type/type-name.dart';

part 'src/armory/code/core/type/type.dart';

part "src/armory/code/language/json.dart";

part 'src/armory/code/language/markdown/markdown.dart';

part 'src/armory/code/language/oop/dart.dart';

part 'src/armory/code/language/oop/java.dart';

part 'src/armory/code/language/oop/oop.dart';

part "src/armory/code/language/yml.dart";

part 'src/armory/container.dart';

part 'src/armory/context.dart';

part 'src/armory/git.dart';

part 'src/armory/io.dart';

part 'src/armory/mustache.dart';

part 'src/armory/node.dart';

part 'src/armory/program.dart';

part 'src/armory/project.dart';

part 'src/armory/text.dart';
