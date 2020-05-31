part of g3gen;

// -----------------------------------------------------------------------------
// Function list
// -----------------------------------------------------------------------------

class CodeFunctionList with IterableMixin<CodeFunction> {
  /// The parent class that owns this list.
  final CodeClazz _clazz;

  final List<CodeFunction> _list = [];

  CodeFunctionList(this._clazz);

  /// Adds a new function
  CodeFunction func(Object name,
      {bool abstract,
      bool private,
      bool protected,
      bool sealed,
      bool override,
      String comment,
      String body,
      Function(CodeFunction) let}) {
    var f = CodeFunction(this, name?.toString(), abstract, private, protected,
        sealed, override, comment, body, let);
    _list.add(f);
    return f;
  }

  @override
  Iterator<CodeFunction> get iterator => _list.iterator;
}

class CodeFunctionReturn {
  String type;
}

// -----------------------------------------------------------------------------
// Function
// -----------------------------------------------------------------------------

class CodeFunction {
  final CodeFunctionList _list;

  /// Function name
  String name;

  // ---------------------------------------------------------------------------
  // Accessibility
  // ---------------------------------------------------------------------------

  /// True indicates that this is an abstract field.
  bool abstract = false;

  /// True indicates that this is a private field.
  bool private = false;

  /// True indicate that this is a protected field.
  bool protected = false;

  /// True indicates that this is a sealed (i.e., not open) field.
  bool sealed = false;

  /// True indicates that this is a override parent's field.
  bool override = false;

  // ---------------------------------------------------------------------------
  // Comment
  // ---------------------------------------------------------------------------

  /// The function level comment.
  CodeComment _comment;

  CodeComment get comment => _comment;

  // ---------------------------------------------------------------------------
  // Input argument list
  // ---------------------------------------------------------------------------

  /// The function input arguments.
  CodeFieldList _inArgList;

  CodeFieldList get inArgList => _inArgList;

  /// Defines a input argument for the function, with:
  /// - [name] is the argument name and [type] is the argument type.
  /// - Optional [defaultValue] and [comment].
  ///
  CodeField inArg(String name, String type,
          {String defaultValue, String comment}) =>
      _inArgList.field(name, type, initializer: defaultValue, comment: comment);

  // ---------------------------------------------------------------------------
  // Output argument list (for some language, it might be possible to have more
  // than one output argument.
  // ---------------------------------------------------------------------------

  /// The function output arguments.
  CodeFieldList _outArgList;

  CodeFieldList get outArgList => _outArgList;

  // ---------------------------------------------------------------------------
  // Constructor
  // ---------------------------------------------------------------------------

  /// Defines a input argument for the function, with:
  /// - Required [type] is the output argument type.
  /// - Optional [comment].
  /// - Optional [name] might be help ful for language like [go] lang.
  ///
  CodeField outArg(String type, {String name, String comment}) =>
      _outArgList.field(name, type, comment: comment);

  /// The internal code block
  CodeBlock _body;

  CodeBlock get body => _body;

  CodeFunction(
      this._list,
      this.name,
      this.abstract,
      this.private,
      this.protected,
      this.sealed,
      this.override,
      String comment,
      String body,
      Function(CodeFunction) let) {
    var config = _list._clazz._list._doc._config;
    // in & out argument list.
    _inArgList = CodeFieldList(config);
    _outArgList = CodeFieldList(config);

    // function comment.
    _comment = CodeComment._(config, comment);

    // function's body.
    _body = CodeBlock(config, body);

    if (let != null) let(this);
  }
}
