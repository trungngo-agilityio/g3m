part of g3.techlab.dart;

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

  /// True indicates that the file need to be overwrite all the time.
  /// False indicates that the file never get overwrite.
  /// null indicates that needs human confirm.
  final bool overwriteIfExists;

  DartCodeFile._(
    this.name, {
    this.source,
    this.overwriteIfExists,
  });

  factory DartCodeFile.of(
    String name, {
    bool overwriteIfExists,
    CodePackage package,
    CodeComment comment,
    List<CodeImport> imports,
    List<String> parts,
    List<CodeField> fields,
    List<CodeEnum> enums,
    List<CodeFunction> functions,
    List<CodeClass> classes,
    List<CodeExtension> extensions,
    List<CodeMixin> mixins,
    Node body,
  }) {
    // Node that java code expect the file name to be class name.
    return DartCodeFile._(
      name,
      overwriteIfExists: overwriteIfExists,
      source: DartCode.of(
          package: package,
          comment: comment,
          imports: imports,
          parts: parts,
          fields: fields,
          enums: enums,
          functions: functions,
          classes: classes,
          extensions: extensions,
          mixins: mixins,
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
        overwriteIfExists: overwriteIfExists,
      ),
    );
  }
}

class DartCode extends SingleChildNode {
  DartCode(Node source) : super(DartCodeConfig(source));

  factory DartCode.of({
    dynamic package,
    dynamic comment,
    dynamic imports,
    List<String> parts,
    dynamic fields,
    dynamic enums,
    dynamic functions,
    dynamic classes,
    dynamic extensions,
    dynamic mixins,
    dynamic body,
  }) {
    Node partsNode;

    if (parts?.isNotEmpty == true) {
      partsNode = Join.newLineSeparated(
        parts.map(
          (e) {
            if (e == null) return null;
            // make sure the part name is always end with .dart extension.
            var name = e;
            if (name?.endsWith(DartCodeFile.extension) != true) {
              name = name + '.' + DartCodeFile.extension;
            }

            return Container([
              'part \'',
              name,
              '\';',
            ]);
          },
        ),
      );

      partsNode = Container([partsNode, '\n']);
    }

    final source = Container([
      CodeStatement.of(
        Container([
          comment,
          package,
          CodeImportList.of(imports),
          partsNode,
          CodeFieldList.of(fields),
          CodeEnumList.of(enums),
          CodeFunctionList.of(functions),
          CodeClassList.of(classes),
          CodeExtensionList.of(extensions),
          CodeMixinList.of(mixins),
        ]),
      ),
      CodeStatementList.of(body),
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
          codeAccessConfig: (_, child) => CodeModifierConfig.forDartLike(child),

          commentConfig: (_, child) => CodeCommentConfig.forDartLike(child),
          placeHolderConfig: null,

          // Package configs
          packageNameConfig: (_, child) =>
              CodePackageNameConfig.forDartLike(child),
          packageConfig: (_, child) => CodePackageConfig.forDartLike(child),

          // Import Configs
          importConfig: (_, child) => CodeImportConfig.forDartLike(child),
          importListConfig: null,
          importTypeConfig: null,

          // Type configs

          typeNameMapperConfig: (_, child) => CodeTypeNameMapperConfig(child, {
            'dynamic': 'dynamic',
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
          typeConfig: (_, child) => CodeTypeConfig.forDartLike(child),
          typeListConfig: null,

          // Expr configs
          nullLiteralConfig: null,
          boolLiteralConfig: null,
          charLiteralConfig: null,
          stringLiteralConfig: (_, child) =>
              CodeStringLiteralConfig.forDartLike(child),
          numericLiteralConfig: null,
          arrayLiteralConfig: null,
          setLiteralConfig: null,
          mapLiteralConfig: null,
          cascadeConfig: (_, child) => CodeCascadeConfig.forDartLike(child),
          spreadConfig: (_, child) => CodeSpreadConfig.forDartLike(child),
          awaitConfig: null,
          yieldConfig: (_, child) => CodeYieldConfig.forDartLike(child),
          refConfig: null,
          varConfig: (_, child) => CodeVarConfig.forDartLike(child),

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
          forConfig: null,
          forEachConfig: (_, child) => CodeForEachConfig.forDartLike(child),
          whileConfig: null,
          functionCallConfig: null,
          constructorCallConfig: (_, child) =>
              CodeConstructorCallConfig.forDartLike(child),
          annotationListConfig: null,

          // Generic configs
          genericParamConfig: null,
          genericParamListConfig: null,

          // Field configs
          fieldNameConfig: (_, child) => CodeFieldNameConfig.forDartLike(child),
          fieldListConfig: null,
          fieldConfig: (_, child) => CodeFieldConfig.forDartLike(child),

          // Arg configs
          argNameConfig: (_, child) => CodeArgNameConfig.forDartLike(child),
          argListConfig: (_, child) => CodeArgListConfig.forDartLike(child),
          argConfig: (_, child) => CodeArgConfig.forDartLike(child),

          // Function configs
          functionThrowListConfig: (_, child) =>
              CodeFunctionThrowListConfig.ignored(child),
          functionThrowConfig: (_, child) =>
              CodeFunctionThrowConfig.ignored(child),
          functionReturnConfig: (_, child) =>
              CodeFunctionReturnConfig.forDartLike(child),
          functionReturnListConfig: null,
          functionNameConfig: (_, child) =>
              CodeFunctionNameConfig.forDartLike(child),
          functionListConfig: null,
          functionConfig: (_, child) => CodeFunctionConfig.forDartLike(child),
          lambdaConfig: null,

          // Enum configs,
          enumValueNameConfig: (_, child) =>
              CodeEnumValueNameConfig.forDartLike(child),
          enumValueListConfig: null,
          enumValueConfig: null,
          enumNameConfig: (_, child) => CodeEnumNameConfig.forDartLike(child),
          enumListConfig: null,
          enumConfig: null,

          // Property configs
          propertyNameConfig: (_, child) =>
              CodePropertyNameConfig.forDartLike(child),
          propertyListConfig: null,
          propertyGetterConfig: (_, child) =>
              CodePropertyGetterConfig.forDartLike(child),
          propertySetterConfig: (_, child) =>
              CodePropertySetterConfig.forDartLike(child),
          propertyConfig: (_, child) => CodePropertyConfig.forDartLike(child),

          // Interface configs
          interfaceListConfig: null,
          interfaceConfig: (_, child) => CodeInterfaceConfig.forJavaLike(child,
              interfaceKeyword: 'class '),

          // Class configs
          classNameConfig: (_, child) => CodeClassNameConfig.forDartLike(child),
          classListConfig: null,
          classConfig: null,
          classConstructorNameConfig: (_, child) =>
              CodeConstructorNameConfig.forDartLike(child),
          classConstructorListConfig: null,
          classConstructorConfig: (_, child) =>
              CodeConstructorConfig.forDartLike(child),

          // Mixin configs
          mixinNameConfig: (_, child) => CodeMixinNameConfig.forDartLike(child),
          mixinListConfig: (_, child) => CodeMixinListConfig.forDartLike(child),
          mixinConfig: (_, child) => CodeMixinConfig.forDartLike(child),

          // Extension configs
          extensionNameConfig: (_, child) =>
              CodeExtensionNameConfig.forDartLike(child),
          extensionListConfig: (_, child) =>
              CodeExtensionListConfig.forDartLike(child),
          extensionConfig: (_, child) => CodeExtensionConfig.forDartLike(child),
        );
}
