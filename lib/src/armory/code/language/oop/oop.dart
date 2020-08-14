part of g3.armory;

typedef OopCodeConfigBuildFunc<T extends Node> = T Function(
    BuildContext context, Node node);

/// Defines global configuration for dart code generation.
///
/// Java default syntax:
/// - Indentation: 2 spaces
/// - Comment: Triple splash
/// - Block: Curly bracket start at the same line.
///
abstract class OopCodeConfig<T extends ExactlyOneNode<T>>
    extends ExactlyOneNode<T> {
  OopCodeConfigBuildFunc<IndentConfig> indentConfig;
  OopCodeConfigBuildFunc<CodeBlockConfig> blockConfig;
  OopCodeConfigBuildFunc<CodeAccessConfig> codeAccessConfig;
  OopCodeConfigBuildFunc<CodeCommentConfig> commentConfig;

  // Package configs
  OopCodeConfigBuildFunc<CodePackageNameConfig> packageNameConfig;
  OopCodeConfigBuildFunc<CodePackageConfig> packageConfig;

  // Import Configs
  OopCodeConfigBuildFunc<CodeImportConfig> importConfig;
  OopCodeConfigBuildFunc<CodeImportListConfig> importListConfig;
  OopCodeConfigBuildFunc<CodeImportTypeConfig> importTypeConfig;

  // Type configs
  OopCodeConfigBuildFunc<CodeTypeNameConfig> typeNameConfig;
  OopCodeConfigBuildFunc<CodeTypeConfig> typeConfig;
  OopCodeConfigBuildFunc<CodeTypeListConfig> typeListConfig;

  // Expr configs
  OopCodeConfigBuildFunc<CodeNullLiteralConfig> nullLiteralConfig;
  OopCodeConfigBuildFunc<CodeBoolLiteralConfig> boolLiteralConfig;
  OopCodeConfigBuildFunc<CodeCharLiteralConfig> charLiteralConfig;
  OopCodeConfigBuildFunc<CodeStringLiteralConfig> stringLiteralConfig;
  OopCodeConfigBuildFunc<CodeNumericLiteralConfig> numericLiteralConfig;
  OopCodeConfigBuildFunc<CodeArrayLiteralConfig> arrayLiteralConfig;
  OopCodeConfigBuildFunc<CodeMapLiteralConfig> mapLiteralConfig;
  OopCodeConfigBuildFunc<CodeVarConfig> varConfig;

  // Statement configs
  OopCodeConfigBuildFunc<CodeStatementListConfig> statementList;
  OopCodeConfigBuildFunc<CodeStatementConfig> statement;
  OopCodeConfigBuildFunc<CodeBreakConfig> breakConfig;
  OopCodeConfigBuildFunc<CodeContinueConfig> continueConfig;
  OopCodeConfigBuildFunc<CodeVarNameConfig> varNameConfig;
  OopCodeConfigBuildFunc<CodeIfConfig> ifConfig;
  OopCodeConfigBuildFunc<CodeElseIfConfig> elseIfConfig;
  OopCodeConfigBuildFunc<CodeReturnConfig> returnConfig;
  OopCodeConfigBuildFunc<CodeWhileConfig> whileConfig;
  OopCodeConfigBuildFunc<CodeFunctionCallConfig> functionCallConfig;

  // Generic configs
  OopCodeConfigBuildFunc<CodeGenericParamConfig> genericParamConfig;
  OopCodeConfigBuildFunc<CodeGenericParamListConfig> genericParamListConfig;

  // Field configs
  OopCodeConfigBuildFunc<CodeFieldNameConfig> fieldNameConfig;
  OopCodeConfigBuildFunc<CodeFieldListConfig> fieldListConfig;
  OopCodeConfigBuildFunc<CodeFieldConfig> fieldConfig;

  // Function configs
  OopCodeConfigBuildFunc<CodeFunctionNameConfig> functionNameConfig;
  OopCodeConfigBuildFunc<CodeFunctionArgNameConfig> functionArgNameConfig;
  OopCodeConfigBuildFunc<CodeFunctionArgListConfig> functionArgListConfig;
  OopCodeConfigBuildFunc<CodeFunctionArgConfig> functionArgConfig;
  OopCodeConfigBuildFunc<CodeFunctionThrowListConfig> functionThrowListConfig;
  OopCodeConfigBuildFunc<CodeFunctionThrowConfig> functionThrowConfig;
  OopCodeConfigBuildFunc<CodeFunctionReturnConfig> functionReturnConfig;
  OopCodeConfigBuildFunc<CodeFunctionReturnListConfig> functionReturnListConfig;
  OopCodeConfigBuildFunc<CodeFunctionListConfig> functionListConfig;
  OopCodeConfigBuildFunc<CodeFunctionConfig> functionConfig;

  // Interface configs
  OopCodeConfigBuildFunc<CodeInterfaceListConfig> interfaceListConfig;
  OopCodeConfigBuildFunc<CodeInterfaceConfig> interfaceConfig;

  // Class configs
  OopCodeConfigBuildFunc<CodeClassNameConfig> classNameConfig;
  OopCodeConfigBuildFunc<CodeClassListConfig> classListConfig;
  OopCodeConfigBuildFunc<CodeClassConfig> classConfig;
  OopCodeConfigBuildFunc<CodeClassConstructorListConfig>
      classConstructorListConfig;
  OopCodeConfigBuildFunc<CodeClassConstructorConfig> classConstructorConfig;

  OopCodeConfig(
    Node child, {
    @required this.indentConfig,
    @required this.blockConfig,
    @required this.codeAccessConfig,
    @required this.commentConfig,

    // Package configs
    @required this.packageNameConfig,
    @required this.packageConfig,

    // Import Configs
    @required this.importConfig,
    @required this.importListConfig,
    @required this.importTypeConfig,

    // Type configs
    @required this.typeNameConfig,
    @required this.typeConfig,
    @required this.typeListConfig,

    // Expr configs
    @required this.nullLiteralConfig,
    @required this.boolLiteralConfig,
    @required this.charLiteralConfig,
    @required this.stringLiteralConfig,
    @required this.numericLiteralConfig,
    @required this.arrayLiteralConfig,
    @required this.mapLiteralConfig,
    @required this.varConfig,

    // Statement configs
    @required this.statementList,
    @required this.statement,
    @required this.breakConfig,
    @required this.continueConfig,
    @required this.varNameConfig,
    @required this.ifConfig,
    @required this.elseIfConfig,
    @required this.returnConfig,
    @required this.whileConfig,
    @required this.functionCallConfig,

    // Generic configs
    @required this.genericParamConfig,
    @required this.genericParamListConfig,

    // Field configs
    @required this.fieldNameConfig,
    @required this.fieldListConfig,
    @required this.fieldConfig,

    // Function configs
    @required this.functionNameConfig,
    @required this.functionArgNameConfig,
    @required this.functionArgListConfig,
    @required this.functionArgConfig,
    @required this.functionThrowListConfig,
    @required this.functionThrowConfig,
    @required this.functionReturnConfig,
    @required this.functionReturnListConfig,
    @required this.functionListConfig,
    @required this.functionConfig,

    // Interface configs
    @required this.interfaceListConfig,
    @required this.interfaceConfig,

    // Class configs
    @required this.classNameConfig,
    @required this.classListConfig,
    @required this.classConfig,
    @required this.classConstructorListConfig,
    @required this.classConstructorConfig,
  }) : super(child) {
    indentConfig = (_, sub) => IndentConfig.useSpace2(sub);
    blockConfig ??= (_, sub) => CodeBlockConfig.curlyBracketSameLine(sub);
    codeAccessConfig ??= (_, sub) => CodeAccessConfig.of(sub);

    commentConfig ??= (_, sub) => CodeCommentConfig.forJavaLike(sub);

    // Package configs
    packageNameConfig ??= (_, sub) => CodePackageNameConfig.forJavaLike(sub);
    packageConfig ??= (_, sub) => CodePackageConfig.forJavaLike(sub);

    // Import Configs
    importConfig ??= (_, sub) => CodeImportConfig.forJavaLike(sub);
    importListConfig ??= (_, sub) => CodeImportListConfig.forJavaLike(sub);
    importTypeConfig ??= (_, sub) => CodeImportTypeConfig.forJavaLike(sub);

    // Type configs
    typeNameConfig ??= (_, sub) => CodeTypeNameConfig.forJavaLike(sub);
    typeConfig ??= (_, sub) => CodeTypeConfig.forJavaLike(sub);
    typeListConfig ??= (_, sub) => CodeTypeListConfig.forJavaLike(sub);

    // Expr configs
    nullLiteralConfig ??= (_, sub) => CodeNullLiteralConfig.forJavaLike(sub);
    boolLiteralConfig ??= (_, sub) => CodeBoolLiteralConfig.forJavaLike(sub);
    charLiteralConfig ??= (_, sub) => CodeCharLiteralConfig.forJavaLike(sub);
    stringLiteralConfig ??=
        (_, sub) => CodeStringLiteralConfig.forJavaLike(sub);
    numericLiteralConfig ??=
        (_, sub) => CodeNumericLiteralConfig.forJavaLike(sub);
    arrayLiteralConfig ??= (_, sub) => CodeArrayLiteralConfig.forJsonLike(sub);
    mapLiteralConfig ??= (_, sub) => CodeMapLiteralConfig.forJsonLike(sub);
    varConfig ??= (_, sub) => CodeVarConfig.forJavaLike(sub);

    // Statement configs
    statementList ??= (_, sub) => CodeStatementListConfig.forJavaLike(sub);
    statement ??= (_, sub) => CodeStatementConfig.forJavaLike(sub);
    breakConfig ??= (_, sub) => CodeBreakConfig.forJavaLike(sub);
    continueConfig ??= (_, sub) => CodeContinueConfig.forJavaLike(sub);
    varNameConfig ??= (_, sub) => CodeVarNameConfig.forJavaLike(sub);
    ifConfig ??= (_, sub) => CodeIfConfig.forJavaLike(sub);
    elseIfConfig ??= (_, sub) => CodeElseIfConfig.forJavaLike(sub);
    returnConfig ??= (_, sub) => CodeReturnConfig.forJavaLike(sub);
    whileConfig ??= (_, sub) => CodeWhileConfig.forJavaLike(sub);
    functionCallConfig ??= (_, sub) => CodeFunctionCallConfig.forJavaLike(sub);

    // Generic configs
    genericParamConfig ??= (_, sub) => CodeGenericParamConfig.forJavaLike(sub);
    genericParamListConfig ??=
        (_, sub) => CodeGenericParamListConfig.forJavaLike(sub);

    // Field configs
    fieldNameConfig ??= (_, sub) => CodeFieldNameConfig.forJavaLike(sub);
    fieldListConfig ??= (_, sub) => CodeFieldListConfig.forJavaLike(sub);
    fieldConfig ??= (_, sub) => CodeFieldConfig.forJavaLike(sub);

    // Function configs
    functionNameConfig ??= (_, sub) => CodeFunctionNameConfig.forJavaLike(sub);
    functionArgNameConfig ??=
        (_, sub) => CodeFunctionArgNameConfig.forJavaLike(sub);
    functionArgListConfig ??=
        (_, sub) => CodeFunctionArgListConfig.forJavaLike(sub);
    functionArgConfig ??= (_, sub) => CodeFunctionArgConfig.forJavaLike(sub);
    functionThrowListConfig ??=
        (_, sub) => CodeFunctionThrowListConfig.forJavaLike(sub);
    functionThrowConfig ??=
        (_, sub) => CodeFunctionThrowConfig.forJavaLike(sub);
    functionReturnConfig ??=
        (_, sub) => CodeFunctionReturnConfig.forJavaLike(sub);
    functionReturnListConfig ??=
        (_, sub) => CodeFunctionReturnListConfig.forJavaLike(sub);
    functionListConfig ??= (_, sub) => CodeFunctionListConfig.forJavaLike(sub);
    functionConfig ??= (_, sub) => CodeFunctionConfig.forJavaLike(sub);

    // Interface configs
    interfaceListConfig ??=
        (_, sub) => CodeInterfaceListConfig.forJavaLike(sub);
    interfaceConfig ??= (_, sub) => CodeInterfaceConfig.forJavaLike(sub);

    // Class configs
    classNameConfig ??= (_, sub) => CodeClassNameConfig.forJavaLike(sub);
    classListConfig ??= (_, sub) => CodeClassListConfig.forJavaLike(sub);
    classConfig ??= (_, sub) => CodeClassConfig.forJavaLike(sub);
    classConstructorListConfig ??=
        (_, sub) => CodeClassConstructorListConfig.forJavaLike(sub);
    classConstructorConfig ??=
        (_, sub) => CodeClassConstructorConfig.forJavaLike(sub);
  }

  static Node abc(BuildContext context, Node child) {
    return CodeAccessConfig.of(child);
  }

  @override
  Node buildOne(BuildContext context, Node child) {
    final configs = <OopCodeConfigBuildFunc<Node>>[
      indentConfig,
      blockConfig,
      codeAccessConfig,

      commentConfig,

      // Package configs
      packageNameConfig,
      packageConfig,

      // Import Configs
      importConfig,
      importListConfig,
      importTypeConfig,

      // Type configs
      typeNameConfig,
      typeConfig,
      typeListConfig,

      // Expr configs
      nullLiteralConfig,
      boolLiteralConfig,
      charLiteralConfig,
      stringLiteralConfig,
      numericLiteralConfig,
      arrayLiteralConfig,
      mapLiteralConfig,
      varConfig,

      // Statement configs
      statementList,
      statement,
      breakConfig,
      continueConfig,
      varNameConfig,
      ifConfig,
      elseIfConfig,
      returnConfig,
      whileConfig,
      functionCallConfig,

      // Generic configs
      genericParamConfig,
      genericParamListConfig,

      // Field configs
      fieldNameConfig,
      fieldListConfig,
      fieldConfig,

      // Function configs
      functionNameConfig,
      functionArgNameConfig,
      functionArgListConfig,
      functionArgConfig,
      functionThrowListConfig,
      functionThrowConfig,
      functionReturnConfig,
      functionReturnListConfig,
      functionListConfig,
      functionConfig,

      // Interface configs
      interfaceListConfig,
      interfaceConfig,

      // Class configs

      classNameConfig,
      classListConfig,
      classConfig,
      classConstructorListConfig,
      classConstructorConfig,
    ];

    for (final i in configs.reversed) {
      child = i(context, child);
    }

    return child;
  }
}
