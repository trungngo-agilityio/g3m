part of g3gen;

typedef WriteCodeDocFunc = void Function(CodeWriter, CodeDoc);
typedef WriteHeaderCommentFunc = void Function(CodeWriter, CodeDoc);

typedef WritePackageFunc = void Function(CodeWriter, CodeDoc);

typedef WriteImportListFunc = Function(CodeWriter, CodeImportList);
typedef WriteImportFunc = void Function(CodeWriter, CodeImport);

typedef WriteClassListFunc = Function(CodeWriter, CodeClazzList);
typedef WriteClassCommentFunc = void Function(CodeWriter, CodeClazz);
typedef WriteClassDefFunc = void Function(CodeWriter, CodeClazz);

typedef WriteClassFieldListFunc = void Function(
    CodeWriter, CodeClazz, CodeFieldList);

typedef WriteClassFieldDefFunc = void Function(
    CodeWriter, CodeClazz, CodeField);

typedef WriteClassFieldCommentFunc = void Function(
    CodeWriter, CodeClazz, CodeField);

typedef WriteClassFunctionListFunc = void Function(
    CodeWriter, CodeClazz, CodeFunctionList);

typedef WriteClassFunctionDefFunc = Function(
    CodeWriter, CodeClazz, CodeFunction);
typedef WriteClassFunctionCommentFunc = Function(
    CodeWriter, CodeClazz, CodeFunction);
// -----------------------------------------------------------------------------
// Configuration
// -----------------------------------------------------------------------------

class CodeConfig extends WriterConfig {
  final CodeLanguage language;

  /// The string function to convert free text to package name.
  StringFunc packageName;

  /// The string function to convert free text to class name
  StringFunc className;

  /// The string function to covert free text to field name.
  StringFunc fieldName;

  /// The string function to convert free text to function name.
  StringFunc functionName;

  /// The string function to convert free text to variable name.
  StringFunc variableName;

  /// The string function to convert free text to type name.
  StringFunc typeName;

  /// The string function to convert type name to natively supported type name.
  StringFunc typeMapper;

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

  String importKeyword;
  String packageKeyword;

  /// For most language, this should be `class`. Except for proto3,
  /// this should be `message`;
  ///
  String classKeyword;
  String interfaceKeyword;

  String publicKeyword;
  String protectedKeyword;
  String privateKeyword;
  String abstractKeyword;
  String sealedKeyword;

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

  WriteCodeDocFunc writeCodeDoc;
  WriteHeaderCommentFunc writeHeaderComment;

  WritePackageFunc writePackage;

  WriteImportListFunc writeImportList;
  WriteImportFunc writeImport;

  WriteClassListFunc writeClassList;
  WriteClassCommentFunc writeClassComment;
  WriteClassDefFunc writeClassDef;

  WriteClassFieldListFunc writeClassFieldList;
  WriteClassFieldDefFunc writeClassFieldDef;
  WriteClassFieldCommentFunc writeClassFieldComment;

  WriteClassFunctionListFunc writeClassFunctionList;
  WriteClassFunctionDefFunc writeClassFunctionDef;
  WriteClassFunctionCommentFunc writeClassFunctionComment;

  // ---------------------------------------------------------------------------
  // Setup for dart code generation.
  // ---------------------------------------------------------------------------

  CodeConfig.forDart() : this();

  CodeConfig.forKotlin()
      : this(
          language: CodeLanguages.kotlin,
          fieldTypeAfterName: true,
          fieldTypeVarSeparator: ': ',
          argTypeAfterName: true,
          argTypeVarSeparator: ': ',
          packageKeyword: 'package ',
          funcKeyword: 'fun ',
        );

  CodeConfig.forJava()
      : this(
          language: CodeLanguages.java,
          headerComment: code.commentJavaDoc,
          classComment: code.commentJavaDoc,
          functionComment: code.commentJavaDoc,
          packageKeyword: 'package ',
        );

  CodeConfig.forCSharp()
      : this(
          language: CodeLanguages.cSharp,
        );

  CodeConfig.forPython()
      : this(
          language: CodeLanguages.python,
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
          funcDef: (outArgs, name, inArgs) => 'def $name (self, $inArgs)',
        );

  CodeConfig.forTypescript()
      : this(
          language: CodeLanguages.typeScript,
          typeMapper: (name) {
            // See https://www.typescriptlang.org/docs/handbook/basic-types.html
            switch (name) {
              case 'String':
                return 'string';
              case 'Bool':
              case 'Boolean':
                return 'boolean';
              case 'Double':
              case 'Float':
              case 'Int32':
              case 'Int64':
              case 'Uint32':
              case 'Uint64':
              case 'Sint32':
              case 'Sint64':
              case 'Sfixed32':
              case 'Sfixed64':
                return 'number';
              case 'bytes':
                return 'dynamic';
              default:
                return name;
            }
          },
          fieldTypeAfterName: true,
          fieldTypeVarSeparator: ': ',
          interfaceKeyword: 'interface ',
          funcKeyword: 'function ',
          publicKeyword: 'export ',
          importKeyword: 'import ',
          writePackage: (CodeWriter w, CodeDoc doc) {
            // Do nothing since Typescript do not have package concept.
          },
          writeClassFieldDef: (CodeWriter w, CodeClazz clz, CodeField f) {
            var name = f.name;
            if (f.nullable == true) {
              name = name + '?';
            }
            w.classField(f.type, name);
          },
        );

  CodeConfig.forProto3()
      : this(
          language: CodeLanguages.proto3,
          typeName: camel,
          fieldName: pascal,
          packageKeyword: 'package ',
          classKeyword: 'message ',
          argTypeAfterName: true,
          fieldIndexed: true,
          funcDef: (outArgs, name, inArgs) =>
              'rpc $name ($inArgs) returns ($outArgs)',
        );

  CodeConfig.forGRpc()
      : this(
          language: CodeLanguages.gRpc,
          typeName: camel,
          fieldName: pascal,
          packageKeyword: 'package ',
          classKeyword: 'service ',
          fieldIndexed: true,
          funcKeyword: 'rpc ',
          argTypeAfterName: true,
          funcDef: (outArgs, name, inArgs) =>
              'rpc $name ($inArgs) returns ($outArgs)',
        );

  CodeConfig.forGo()
      : this(
          language: CodeLanguages.go,
          fieldTypeAfterName: true,
          fieldTypeVarSeparator: ' ',
          argTypeAfterName: true,
          argTypeVarSeparator: ' ',
          packageKeyword: 'package ',
          classKeyword: 'struct ',
          funcKeyword: 'func ',
          lineEnding: '',
        );

  // ---------------------------------------------------------------------------
  // Custom constructor.
  // ---------------------------------------------------------------------------
  CodeConfig(
      {int tabSize = 2,
      bool useTab = false,
      this.language,
      this.packageName,
      this.className,
      this.fieldName,
      this.functionName,
      this.variableName,
      this.typeName,
      this.typeMapper,
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
      this.importKeyword,
      this.packageKeyword,
      this.classKeyword,
      this.interfaceKeyword,
      this.publicKeyword,
      this.protectedKeyword,
      this.privateKeyword,
      this.abstractKeyword,
      this.sealedKeyword,
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
      this.writeImportList,
      this.writeImport,
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
    interfaceKeyword ??= classKeyword;
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
    writeImportList ??= _writeImportList;
    writeImport ??= _writeImport;

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

final WriteCodeDocFunc _writeCodeDoc = (w, doc) {
  var cfg = w.codeConfig;
  cfg.writeHeaderComment(w, doc);
  cfg.writePackage(w, doc);
  cfg.writeImportList(w, doc.importList);
  cfg.writeClassList(w, doc.clazzList);
};

final WriteHeaderCommentFunc _writeHeaderComment = (w, doc) {
  w.headerComment(doc.comment.text);
};

final WritePackageFunc _writePackage = (w, doc) {
  // Writes out the package
  var package = doc.package;
  if (package == null) return;

  var cfg = w.codeConfig;
  var name = cfg.packageName % package;

  w.statement('${cfg.packageKeyword}$name');
};

// =============================================================================
// Import
// =============================================================================

final WriteImportListFunc _writeImportList = (w, importList) {
  final cfg = w.codeConfig;

  if (importList == null || importList.isEmpty) return;
  for (final imp in importList) {
    w.writeln();
    cfg.writeImport(w, imp);
  }
};

final WriteImportFunc _writeImport = (w, imp) {
  assert(imp != null);
  final cfg = w.codeConfig;
  final types = imp.types;
  if (types == null || types.isEmpty) {
    // import a entire package.
    w.write(cfg.importKeyword);
    w.write(imp.package);
    if (imp.alias != null) {
      w.write('as ');
      w.write(imp.alias);
    }
    w.writeln(cfg.lineEnding);
  } else {
    // import an individual type.
    w.write(cfg.importKeyword);

    w.block(null, () {
      // TODO: Implement this better since this is different from language
      // to language.
      for (final t in types) {
        w.write(t);

        if (imp.alias != null) {
          w.write('as ');
          w.write(imp.alias);
        }
        w.writeln(',');
      }
    });

    w.write(' from ');
    w.write(imp.package);
    w.writeln(cfg.lineEnding);
  }
};

// =============================================================================
// Class
// =============================================================================

final WriteClassListFunc _writeClassList = (w, clazzList) {
  final cfg = w.codeConfig;

  // Writes out all class in the class list.
  for (final clz in clazzList) {
    w.writeln();

    cfg.writeClassComment(w, clz);
    cfg.writeClassDef(w, clz);

    w.block(null, () {
      cfg.writeClassList(w, clz.clazzList);
      cfg.writeClassFieldList(w, clz, clz.fieldList);
      cfg.writeClassFunctionList(w, clz, clz.functionList);
    });
  }
};

final WriteClassCommentFunc _writeClassComment = (w, clz) {
  w.classComment(clz.comment.text);
};

final WriteClassDefFunc _writeClassDef = (w, clz) {
  // -------------------------------------------------------------------------
  // Writes out class name and open block
  // -------------------------------------------------------------------------
  var cfg = w.codeConfig;
  var name = cfg.className % clz.name;

  if (clz.interface == true) {
    name = cfg.interfaceKeyword + name;
  } else {
    name = cfg.classKeyword + name;
  }

  if (clz.public == true && cfg.publicKeyword != null) {
    name = cfg.publicKeyword + name;
  }
  if (clz.protected == true && cfg.protectedKeyword != null) {
    name = cfg.protectedKeyword + name;
  }
  if (clz.private == true && cfg.privateKeyword != null) {
    name = cfg.privateKeyword + name;
  }
  if (clz.abstract == true && cfg.abstractKeyword != null) {
    name = cfg.abstractKeyword + name;
  }
  if (clz.sealed == true && cfg.sealedKeyword != null) {
    name = cfg.sealedKeyword + name;
  }

  w.write(name);
};

// =============================================================================
// Class Field
// =============================================================================

final WriteClassFieldListFunc _writeClassFieldList = (w, clz, list) {
  var cfg = w.codeConfig;

  // -------------------------------------------------------------------------
  // Writes out the list of fields
  // -------------------------------------------------------------------------
  for (var f in clz.fieldList) {
    ~w;

    cfg.writeClassFieldComment(w, clz, f);
    cfg.writeClassFieldDef(w, clz, f);
  }
};

final WriteClassFieldCommentFunc _writeClassFieldComment = (w, clz, f) {
  w.fieldComment(f.comment.text);
};

final WriteClassFieldDefFunc _writeClassFieldDef = (w, clz, f) {
  w.classField(f.type, f.name, f.index);
};

// =============================================================================
// Class Function
// =============================================================================

final WriteClassFunctionListFunc _writeClassFunctionList = (w, clz, list) {
  var cfg = w.codeConfig;
  // -------------------------------------------------------------------------
  // Writes out the list of functions
  // -------------------------------------------------------------------------
  for (var f in clz.functionList) {
    ~w;

    cfg.writeClassFunctionComment(w, clz, f);
    cfg.writeClassFunctionDef(w, clz, f);
    if (f.abstract == true) {
      // End the definition
      w.lineEnd();
    } else {
      // Write out the function block.
      w.block(f.body.content);
    }
  }
};

final WriteClassFunctionCommentFunc _writeClassFunctionComment = (w, clz, f) {
  w.classComment(f.comment.text);
};

final WriteClassFunctionDefFunc _writeClassFunctionDef = (w, clz, f) {
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
};
