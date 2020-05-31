part of g3gen;

// -----------------------------------------------------------------------------
// Configuration
// -----------------------------------------------------------------------------

class CodeConfig extends WriterConfig {
  /// The string function to convert free text to package name.
  StringFunc packageName;

  /// The string function to convert free text to class name
  StringFunc className;
  StringFunc fieldName;
  StringFunc functionName;

  StringFunc variableName;
  StringFunc typeName;

  StringFunc packageStatement;

  StringFunc headerComment;
  StringFunc classComment;
  StringFunc functionComment;
  StringFunc fieldComment;
  StringFunc lineComment;

  String defaultFunctionReturnType;
  String defaultFunctionEmptyArgType;

  /// True indicates that the arg type goes after.
  /// For instance, in Dart, this value should be false.
  /// An example of var definition is "String s";
  /// In Typescript, this value should be true.
  /// An example, s: String.
  ///
  bool fieldTypeAfterName;

  /// The separator between var and a type.
  /// This should be ':' for Typescript and empty for dart.
  String fieldTypeVarSeparator;

  // Most language, this value should be the same with [fieldTypeAfterName].
  // For proto3 / grpc, this is different.
  bool argTypeAfterName;

  // Most language, this value should be the same with [fieldTypeVarSeparator].
  // For proto3 / grpc, this is different.
  String argTypeVarSeparator;

  /// The separator between arg list. Should be ', ' for most
  /// languages.
  ///
  String argListSeparator;

  String packageKeyword;

  /// For most language, this should be `class`. Except for proto3,
  /// this should be `message`;
  ///
  String classKeyword;

  /// The func keyword that marks the beginning of a function.
  /// For dart, there is none. For Typescript, this should be 'function'.
  String funcKeyword;

  String lineEnding;
  String blockStart;
  String blockEnd;

  bool fieldIndexed;

  // ---------------------------------------------------------------------------
  // Code generation strategy.
  // The default settings are for darts.
  // ---------------------------------------------------------------------------

  /// This function help to write a type var pair to the right format.
  ///
  Function(String type, String name) fieldTypeName;
  Function(String type, String name) argTypeName;

  /// This function help to write out a function definition in right format.
  ///
  Function(String, String, String) funcDef;

  Function(CodeWriter, CodeDoc) writeCodeDoc;
  Function(CodeWriter, CodeDoc) writeHeaderComment;
  Function(CodeWriter, CodeDoc) writePackage;
  Function(CodeWriter, CodeClazzList) writeClassList;
  Function(CodeWriter, CodeClazz) writeClassComment;
  Function(CodeWriter, CodeClazz) writeClassDef;
  Function(CodeWriter, CodeClazz, CodeFieldList) writeClassFieldList;
  Function(CodeWriter, CodeClazz, CodeField) writeClassFieldDef;
  Function(CodeWriter, CodeClazz, CodeField) writeClassFieldComment;
  Function(CodeWriter, CodeClazz, CodeFunctionList) writeClassFunctionList;
  Function(CodeWriter, CodeClazz, CodeFunction) writeClassFunctionDef;
  Function(CodeWriter, CodeClazz, CodeFunction) writeClassFunctionComment;

  // ---------------------------------------------------------------------------
  // Setup for dart code generation.
  // ---------------------------------------------------------------------------

  CodeConfig.forDart() : this();

  CodeConfig.forKotlin()
      : this(
            fieldTypeAfterName: true,
            fieldTypeVarSeparator: ': ',
            argTypeAfterName: true,
            argTypeVarSeparator: ': ',
            packageKeyword: 'package ',
            funcKeyword: 'fun ');

  CodeConfig.forJava()
      : this(
          headerComment: code.commentJavaDoc,
          classComment: code.commentJavaDoc,
          functionComment: code.commentJavaDoc,
          packageKeyword: 'package ',
        );

  CodeConfig.forCSharp() : this();

  CodeConfig.forPython()
      : this(
            functionName: snake,
            fieldName: snake,
            fieldTypeAfterName: true,
            fieldTypeVarSeparator: ': ',
            argTypeAfterName: true,
            argTypeVarSeparator: ': ',
            headerComment: code.commentHash,
            classComment: code.commentHash,
            functionComment: code.commentHash,
            lineComment: code.commentHash,
            funcKeyword: 'def ',
            packageKeyword: 'package ',
            classKeyword: 'class ',
            blockStart: ':',
            blockEnd: '',
            funcDef: (outArgs, name, inArgs) => 'def $name (self, $inArgs)');

  CodeConfig.forTypescript()
      : this(
            fieldTypeAfterName: true,
            fieldTypeVarSeparator: ': ',
            packageKeyword: 'package ',
            funcKeyword: 'function ');

  CodeConfig.forProto3()
      : this(
            typeName: camel,
            fieldName: pascal,
            packageKeyword: 'package ',
            classKeyword: 'message ',
            argTypeAfterName: true,
            fieldIndexed: true,
            funcDef: (outArgs, name, inArgs) =>
                'rpc $name ($inArgs) returns ($outArgs)');

  CodeConfig.forGRpc()
      : this(
            typeName: camel,
            fieldName: pascal,
            packageKeyword: 'package ',
            classKeyword: 'service ',
            fieldIndexed: true,
            funcKeyword: 'rpc ',
            argTypeAfterName: true,
            funcDef: (outArgs, name, inArgs) =>
                'rpc $name ($inArgs) returns ($outArgs)');

  CodeConfig.forGo()
      : this(
            fieldTypeAfterName: true,
            fieldTypeVarSeparator: ' ',
            argTypeAfterName: true,
            argTypeVarSeparator: ' ',
            packageKeyword: 'package ',
            classKeyword: 'struct ',
            funcKeyword: 'func ',
            lineEnding: '');

  // ---------------------------------------------------------------------------
  // Custom constructor.
  // ---------------------------------------------------------------------------
  CodeConfig(
      {int tabSize = 2,
      bool useTab = false,
      this.packageName,
      this.className,
      this.fieldName,
      this.functionName,
      this.variableName,
      this.typeName,
      this.packageStatement,
      this.headerComment,
      this.classComment,
      this.functionComment,
      this.fieldComment,
      this.lineComment,
      this.defaultFunctionReturnType,
      this.defaultFunctionEmptyArgType,
      this.fieldTypeAfterName,
      this.fieldTypeVarSeparator,
      this.argTypeAfterName,
      this.argTypeVarSeparator,
      this.argListSeparator,
      this.packageKeyword,
      this.classKeyword,
      this.funcKeyword,
      this.lineEnding,
      this.blockStart,
      this.blockEnd,
      this.fieldIndexed,
      this.fieldTypeName,
      this.argTypeName,
      this.funcDef,
      this.writeCodeDoc,
      this.writeHeaderComment,
      this.writePackage,
      this.writeClassList,
      this.writeClassComment,
      this.writeClassDef,
      this.writeClassFieldList,
      this.writeClassFieldDef,
      this.writeClassFieldComment,
      this.writeClassFunctionList,
      this.writeClassFunctionDef,
      this.writeClassFunctionComment})
      : super(tabSize: tabSize, useTab: useTab) {
    packageName ??= camel;
    className ??= pascal;
    fieldName ??= camel;
    functionName ??= camel;
    variableName ??= camel;
    typeName ??= pascal;

    packageStatement ??= ignore;
    headerComment ??= code.commentTripleSplash;
    classComment ??= code.commentTripleSplash;
    functionComment ??= code.commentTripleSplash;
    fieldComment ??= code.commentTripleSplash;
    lineComment ??= code.commentDoubleSplash;
    defaultFunctionReturnType ??= 'void';
    defaultFunctionEmptyArgType ??= '';

    fieldTypeAfterName ??= false;
    fieldTypeVarSeparator ??= ' ';

    argTypeAfterName ??= fieldTypeAfterName;
    argTypeVarSeparator ??= fieldTypeVarSeparator;

    argListSeparator ??= ', ';

    packageKeyword ??= 'library ';
    classKeyword ??= 'class ';
    funcKeyword ??= '';

    lineEnding ??= ';';
    blockStart ??= '{';
    blockEnd ??= '}';
    fieldIndexed ??= false;

    fieldTypeName ??= fieldTypeAfterName
        ? (t, v) => '$v$fieldTypeVarSeparator$t'
        : (t, v) => '$t$fieldTypeVarSeparator$v';

    argTypeName ??= argTypeAfterName
        ? (t, v) => '$v$argTypeVarSeparator$t'
        : (t, v) => '$t$argTypeVarSeparator$v';

    funcDef ??= fieldTypeAfterName
        ? (o, n, i) => '$funcKeyword$n($i)$argTypeVarSeparator$o'
        : (o, n, i) => '$o $funcKeyword$n($i)';

    writeCodeDoc ??= _writeCodeDoc;
    writeHeaderComment ??= _writeHeaderComment;
    writePackage ??= _writePackage;

    writeClassList ??= _writeClassList;
    writeClassComment ??= _writeClassComment;
    writeClassDef ??= _writeClassDef;
    writeClassFieldList ??= _writeClassFieldList;
    writeClassFieldDef ??= _writeClassFieldDef;
    writeClassFieldComment ??= _writeClassFieldComment;
    writeClassFunctionList ??= _writeClassFunctionList;
    writeClassFunctionDef ??= _writeClassFunctionDef;
    writeClassFunctionComment ??= _writeClassFunctionComment;
  }
}

void _writeCodeDoc(CodeWriter w, CodeDoc doc) {
  var cfg = w.codeConfig;
  cfg.writeHeaderComment(w, doc);
  cfg.writePackage(w, doc);
  cfg.writeClassList(w, doc.clazzList);
}

void _writeHeaderComment(CodeWriter w, CodeDoc doc) {
  w.headerComment(doc.comment.text);
}

void _writePackage(CodeWriter w, CodeDoc doc) {
  // Writes out the package
  var package = doc.package;
  if (package == null) return;

  var cfg = w.codeConfig;
  var name = cfg.packageName % package;

  w.statement('${cfg.packageKeyword}$name');
}

void _writeClassList(CodeWriter w, CodeClazzList clazzList) {
  var cfg = w.codeConfig;

  // Writes out all class in the class list.
  for (var clz in clazzList) {
    ~w;

    cfg.writeClassComment(w, clz);
    cfg.writeClassDef(w, clz);

    w.block(null, () {
      cfg.writeClassList(w, clz.clazzList);
      cfg.writeClassFieldList(w, clz, clz.fieldList);
      cfg.writeClassFunctionList(w, clz, clz.functionList);
    });
  }
}

void _writeClassComment(CodeWriter w, CodeClazz clz) {
  w.classComment(clz.comment.text);
}

void _writeClassDef(CodeWriter w, CodeClazz clz) {
  // -------------------------------------------------------------------------
  // Writes out class name and open block
  // -------------------------------------------------------------------------
  var cfg = w.codeConfig;
  var name = cfg.className % clz.name;
  w + '${cfg.classKeyword}$name ';
}

void _writeClassFieldList(CodeWriter w, CodeClazz clz, CodeFieldList list) {
  var cfg = w.codeConfig;

  // -------------------------------------------------------------------------
  // Writes out the list of fields
  // -------------------------------------------------------------------------
  for (var f in clz.fieldList) {
    ~w;

    cfg.writeClassFieldComment(w, clz, f);
    cfg.writeClassFieldDef(w, clz, f);
  }
}

void _writeClassFieldComment(CodeWriter w, CodeClazz clz, CodeField f) {
  w.fieldComment(f.comment.text);
}

void _writeClassFieldDef(CodeWriter w, CodeClazz clz, CodeField f) {
  w.classField(f.type, f.name, f.index);
}

void _writeClassFunctionList(
    CodeWriter w, CodeClazz clz, CodeFunctionList list) {
  var cfg = w.codeConfig;
  // -------------------------------------------------------------------------
  // Writes out the list of functions
  // -------------------------------------------------------------------------
  for (var f in clz.functionList) {
    ~w;

    cfg.writeClassFunctionComment(w, clz, f);
    cfg.writeClassFunctionDef(w, clz, f);
    if (f.abstract) {
      // End the definition
      w.lineEnd();
    } else {
      // Write out the function block.
      w.block(f.body.content);
    }
  }
}

void _writeClassFunctionComment(CodeWriter w, CodeClazz clz, CodeFunction f) {
  w.classComment(f.comment.text);
}

void _writeClassFunctionDef(CodeWriter w, CodeClazz clz, CodeFunction f) {
  var cfg = w.codeConfig;

  // -----------------------------------------------------------------------
  // Compute function name, out type, and in argument
  // -----------------------------------------------------------------------
  var fName = cfg.fieldName % f.name;
  var outType = cfg.className % f.outArgList.first.type;

  var args = f.inArgList.map((arg) {
    var inName = cfg.variableName % arg.name;
    var inType = cfg.className % arg.type;
    return cfg.argTypeName(inType, inName);
  }).join(cfg.argListSeparator);

  // -----------------------------------------------------------------------
  // Write out function definition
  // -----------------------------------------------------------------------
  w + cfg.funcDef(outType, fName, args);
}
