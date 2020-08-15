part of g3.armory.dart;

/// Defines a dart code fine.
/// This help to enforce the dart syntax and [DartCodeConfig] will
/// be automatically added in the node tree.
///
class DartCodeFile implements Node {
  static const String syntax = 'dart';
  static const String extension = 'dart';

  /// The file name without extension.
  final String name;

  /// The file content.
  final Node source;

  DartCodeFile._(
    this.name, {
    this.source,
  });

  factory DartCodeFile.of(
    String name, {
    CodePackage package,
    CodeComment comment,
    List<CodeImport> imports,
    List<CodeEnum> enums,
    List<CodeFunction> functions,
    List<CodeClass> classes,
    Node body,
  }) {
    // Node that java code expect the file name to be class name.
    return DartCodeFile._(
      name,
      source: DartCode.of(
          package: package,
          comment: comment,
          imports: imports,
          enums: enums,
          functions: functions,
          classes: classes,
          body: body),
    );
  }

  @override
  Node build(BuildContext context) {
    return DartCodeConfig(
      CodeFile(
        name: name,
        extension: extension,
        syntax: syntax,
        source: source,
      ),
    );
  }
}

class DartCode extends SingleChildNode {
  DartCode(Node source) : super(DartCodeConfig(source));

  factory DartCode.of({
    CodePackage package,
    CodeComment comment,
    List<CodeEnum> enums,
    List<CodeImport> imports,
    List<CodeFunction> functions,
    List<CodeClass> classes,
    Node body,
  }) {
    var source = Container([
      comment,
      package,
      CodeImportList.of(imports),
      CodeEnumList.of(enums),
      CodeFunctionList.of(functions),
      CodeClassList.of(classes),
      body,
    ]);

    // Node that java code expect the file name to be class name.
    return DartCode(source);
  }
}

/// Defines global configuration for java code generation.
///
class DartCodeConfig extends OopCodeConfig<DartCodeConfig> {
  DartCodeConfig(Node child)
      : super(
          child,
          indentConfig: null,
          blockConfig: null,
          codeAccessConfig: (_, sub) => CodeModifierConfig.forJavaLike(
            sub,
            factoryKeyword: 'factory ',
            publicKeyword: null,
            privateKeyword: null,
            protectedKeyword: null,
            internalKeyword: null,
          ),

          commentConfig: (_, sub) => CodeCommentConfig.forDartLike(sub),

          // Package configs
          packageNameConfig: (_, sub) => CodePackageNameConfig.forDartLike(sub),
          packageConfig: (_, sub) =>
              CodePackageConfig.forJavaLike(sub, packageKeyword: 'library'),

          // Import Configs
          importConfig: (_, sub) => CodeImportConfig.forDartLike(sub),
          importListConfig: null,
          importTypeConfig: null,

          // Type configs

          typeNameMapperConfig: (_, sub) => CodeTypeNameMapperConfig(sub, {
            'void': 'void',
            'null': 'null',
            'byte': 'byte',
            'short': 'short',
            'int': 'int',
            'long': 'long',
            'float': 'float',
            'double': 'double',
            'bool': 'bool',
          }),
          typeNameConfig: null,
          typeConfig: null,
          typeListConfig: null,

          // Expr configs
          nullLiteralConfig: null,
          boolLiteralConfig: null,
          charLiteralConfig: null,
          stringLiteralConfig: null,
          numericLiteralConfig: null,
          arrayLiteralConfig: null,
          mapLiteralConfig: null,
          awaitConfig: null,
          yieldConfig: (_, sub) => CodeYieldConfig.forDartLike(sub),
          varConfig: (_, sub) => CodeVarConfig.forDartLike(sub),

          // Statement configs
          statementList: null,
          statement: null,
          breakConfig: null,
          continueConfig: null,
          varNameConfig: null,
          ifConfig: null,
          elseIfConfig: null,
          returnConfig: null,
          forConfig: null,
          forEachConfig: null,
          whileConfig: null,
          functionCallConfig: null,

          annotationNameConfig: null,
          annotationListConfig: null,
          annotationConfig: null,

          // Generic configs
          genericParamConfig: null,
          genericParamListConfig: null,

          // Field configs
          fieldNameConfig: null,
          fieldListConfig: null,
          fieldConfig: null,

          // Function configs
          functionNameConfig: null,
          functionArgNameConfig: null,
          functionArgListConfig: null,
          functionArgConfig: null,
          functionThrowListConfig: null,
          functionThrowConfig: null,
          functionReturnConfig: (_, sub) =>
              CodeFunctionReturnConfig.forDartLike(sub),
          functionReturnListConfig: null,
          functionListConfig: null,
          functionConfig: null,

          // Enum configs,
          enumValueNameConfig: (_, sub) =>
              CodeEnumValueNameConfig.forDartLike(sub),
          enumValueListConfig: null,
          enumValueConfig: null,
          enumNameConfig: null,
          enumListConfig: null,
          enumConfig: null,

          // Interface configs
          interfaceListConfig: null,
          interfaceConfig: (_, sub) =>
              CodeInterfaceConfig.forJavaLike(sub, interfaceKeyword: 'class '),

          // Class configs
          classNameConfig: null,
          classListConfig: null,
          classConfig: null,
          classConstructorListConfig: null,
          classConstructorConfig: null,
        );
}
