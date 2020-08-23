part of g3.armory.java;

/// Defines a dart code fine.
/// This help to enforce the dart syntax and [DatCode] will
/// be automatically added in the node tree.
///
class JavaCodeFile implements Node {
  static const String syntax = 'java';
  static const String extension = 'java';

  /// The file name without extension.
  final String name;

  /// The file content.
  final Node source;

  JavaCodeFile._(this.name, {this.source});

  factory JavaCodeFile.of(
    String name, {
    CodePackage package,
    CodeComment comment,
    List<CodeImport> imports,
    List<CodeEnum> enums,
    List<CodeFunction> functions,
    List<CodeInterface> interfaces,
    List<CodeClass> classes,
    Node body,
  }) {
    // Node that java code expect the file name to be class name.
    return JavaCodeFile._(
      name,
      source: JavaCode.of(
          package: package,
          comment: comment,
          imports: imports,
          enums: enums,
          functions: functions,
          interfaces: interfaces,
          classes: classes,
          body: body),
    );
  }

  @override
  Node build(BuildContext context) {
    return JavaCodeConfig(
      CodeFile(
        name: name,
        extension: extension,
        syntax: syntax,
        source: source,
      ),
    );
  }
}

class JavaCode extends SingleChildNode {
  JavaCode(Node source) : super(JavaCodeConfig(source));

  factory JavaCode.of({
    dynamic package,
    dynamic comment,
    dynamic imports,
    dynamic enums,
    dynamic functions,
    dynamic interfaces,
    dynamic classes,
    dynamic body,
  }) {
    final source = Container([
      CodeStatement.of(
        Container([
          comment,
          package,
          CodeImportList.of(imports),
          CodeEnumList.of(enums),
          CodeFunctionList.of(functions),
          CodeClassList.of(classes),
        ]),
      ),
      CodeStatementList.of(body),
    ]);
    // Node that java code expect the file name to be class name.
    return JavaCode(source);
  }
}

/// Defines global configuration for java code generation.
///
class JavaCodeConfig extends OopCodeConfig<JavaCodeConfig> {
  JavaCodeConfig(Node child)
      : super(
          child,
          indentConfig: null,
          blockConfig: null,
          codeAccessConfig: null,

          commentConfig: null,
          placeHolderConfig: null,

          // Package configs
          packageNameConfig: null,
          packageConfig: null,

          // Import Configs
          importConfig: null,
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
            'boolean': 'boolean',
            'char': 'char',
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
          cascadeConfig: null,
          spreadConfig: null,
          awaitConfig: null,
          yieldConfig: null,
          refConfig: null,
          varConfig: null,

          // Statement configs
          exprConfig: null,
          exprListConfig: null,
          statementListConfig: null,
          statementConfig: null,
          breakConfig: null,
          continueConfig: null,
          varNameConfig: null,
          ifConfig: null,
          elseIfConfig: null,
          returnConfig: null,
          whileConfig: null,
          forConfig: null,
          forEachConfig: null,
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

          // Arg configs
          argNameConfig: null,
          argListConfig: null,
          argConfig: null,

          // Function configs
          functionThrowListConfig: null,
          functionThrowConfig: null,
          functionReturnConfig: null,
          functionReturnListConfig: null,
          functionNameConfig: null,
          functionListConfig: null,
          functionConfig: null,
          lambdaConfig: null,

          // Enum configs,
          enumValueNameConfig: null,
          enumValueListConfig: null,
          enumValueConfig: null,
          enumNameConfig: null,
          enumListConfig: null,
          enumConfig: null,

          // Property configs
          propertyNameConfig: null,
          propertyListConfig: null,
          propertyGetterConfig: null,
          propertySetterConfig: null,
          propertyConfig: null,

          // Interface configs
          interfaceListConfig: null,
          interfaceConfig: null,

          // Class configs

          classNameConfig: null,
          classListConfig: null,
          classConfig: null,
          classConstructorNameConfig: null,
          classConstructorListConfig: null,
          classConstructorConfig: null,
        );
}
