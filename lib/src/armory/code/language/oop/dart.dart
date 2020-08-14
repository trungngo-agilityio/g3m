part of g3.armory;

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
    List<CodeFunction> functions,
    List<CodeInterface> interfaces,
    List<CodeClass> classes,
    Node body,
  }) {
    var source = Container([
      comment,
      package,
      CodeImportList.of(imports),
      CodeFunctionList.of(functions),
      CodeInterfaceList.of(interfaces),
      CodeClassList.of(classes),
      body,
    ]);

    // Node that dart code expect the file name to be class name.
    return DartCodeFile._(name, source: source);
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

/// Defines global configuration for java code generation.
///
class DartCodeConfig extends OopCodeConfig<DartCodeConfig> {
  DartCodeConfig(Node child)
      : super(
          child,
          indentConfig: null,
          blockConfig: null,
          codeAccessConfig: (_, sub) => CodeAccessConfig.forJavaLike(
            sub,
            factoryKeyword: 'factory ',
            publicKeyword: null,
            privateKeyword: null,
            protectedKeyword: null,
            internalKeyword: null,
          ),

          commentConfig: null,

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
          functionReturnConfig: null,
          functionReturnListConfig: null,
          functionListConfig: null,
          functionConfig: null,

          // Interface configs
          interfaceListConfig: null,
          interfaceConfig: null,

          // Class configs
          classNameConfig: null,
          classListConfig: null,
          classConfig: null,
          classConstructorListConfig: null,
          classConstructorConfig: null,
        );
}
