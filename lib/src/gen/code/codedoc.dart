part of g3gen;

// -----------------------------------------------------------------------------
// Document
// -----------------------------------------------------------------------------

class CodeDoc implements WritableProjectItem {
  /// The configuration that control how the code should be written.
  CodeConfig _config;

  /// The package for this code document.
  String package;

  // ---------------------------------------------------------------------------
  // Comment
  // ---------------------------------------------------------------------------

  /// The function level comment.
  CodeComment _comment;

  CodeComment get comment => _comment;

  // ---------------------------------------------------------------------------
  // Class list
  // ---------------------------------------------------------------------------

  /// The top-level class list defined in this document.
  CodeClazzList _clazzList;

  CodeClazzList get clazzList => _clazzList;

  // ---------------------------------------------------------------------------
  // Import list
  // ---------------------------------------------------------------------------

  /// The import list at the top of the document.
  CodeImportList _importList;

  CodeImportList get importList => _importList;

  CodeDoc([this._config]) {
    _config ??= CodeConfig();
    // function comment.
    _comment = CodeComment._(_config, '');

    _clazzList = CodeClazzList(this);
    _importList = CodeImportList();
  }

  CodeImport import({String package, List<String> types, String alias}) =>
      _importList.import(package: package, types: types, alias: alias);

  /// Defines a new class.
  /// - [name] is the class name.
  /// - [abstract], [private], [protected], [sealed] for accessibility.
  /// - [comment] for simple online liner text comment.
  /// - [let] for defining class body (e.g., fields, functions, etc).
  ///
  CodeClazz clazz(
    Object name, {
    bool interface,
    bool abstract,
    bool public,
    bool private,
    bool protected,
    bool sealed,
    String comment,
    Function(CodeClazz) let,
  }) =>
      _clazzList.clazz(
        name,
        interface: interface,
        abstract: abstract,
        public: public,
        private: private,
        protected: protected,
        sealed: sealed,
        comment: comment,
        let: let,
      );

  String get content {
    var buf = StringBuffer();
    var w = CodeWriter._(buf, _config);
    _config.writeCodeDoc(w, this);
    return buf.toString();
  }

  @override
  void write(StringSink out) {
    var w = CodeWriter._(out, _config);
    _config.writeCodeDoc(w, this);
  }
}
