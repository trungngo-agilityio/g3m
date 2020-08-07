part of g3gen;

// -----------------------------------------------------------------------------
// Class list
// -----------------------------------------------------------------------------

class CodeClazzList with IterableMixin<CodeClazz> {
  final CodeDoc _doc;

  final CodeClazz _clazz;

  // The list of class defined in this document.
  final List<CodeClazz> _list = [];

  CodeClazzList(this._doc, [this._clazz]);

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
  }) {
    var clz = CodeClazz(
      this,
      name?.toString(),
      interface: interface,
      abstract: abstract,
      public: public,
      private: private,
      protected: protected,
      sealed: sealed,
      comment: comment,
      let: let,
    );
    _list.add(clz);
    return clz;
  }

  @override
  Iterator<CodeClazz> get iterator => _list.iterator;
}

// -----------------------------------------------------------------------------
// Class
// -----------------------------------------------------------------------------

/// Models a common OOP class. Each class would have
/// - a [name].
/// - a class-level [comment], which is a [CodeComment].
/// - a [fieldList], which is a list of [CodeField].
/// - a [clazzList], which is a list of [CodeClazz].
///
class CodeClazz {
  final CodeClazzList _list;

  /// The class name.
  String name;

  /// True indicates that this is an interface.
  bool interface;

  /// True indicates that this is an abstract class.
  bool abstract;

  /// True indicates that this is a private class.
  bool private;

  /// True indicates that this is a public class.
  bool public;

  /// True indicate that this is a protected class.
  bool protected;

  /// True indicates that this is a sealed (i.e., not open) class.
  bool sealed;

  // ---------------------------------------------------------------------------
  // Comment
  // ---------------------------------------------------------------------------
  CodeComment _comment;

  /// Gets the code comment for the current class.
  ///
  CodeComment get comment => _comment;

  // ---------------------------------------------------------------------------
  // Nested class list
  // ---------------------------------------------------------------------------
  CodeClazzList _clazzList;

  /// Gets the nested class definition.
  CodeClazzList get clazzList => _clazzList;

  /// Adds a new nested class in the current class;
  CodeClazz clazz(String name, {String comment, Function(CodeClazz) let}) =>
      _clazzList.clazz(name, comment: comment, let: let);

  // ---------------------------------------------------------------------------
  // Field list
  // ---------------------------------------------------------------------------
  CodeFieldList _fieldList;

  /// Gets the fields defined in this class.
  CodeFieldList get fieldList => _fieldList;

  /// Adds a new field in the current class.
  CodeField field(Object name, Object type,
          {Object initializer,
          int index,
          bool abstract,
          bool private,
          bool protected,
          bool sealed,
          bool override,
          bool nullable,
          String comment}) =>
      _fieldList.field(name, type,
          initializer: initializer,
          index: index,
          abstract: abstract,
          private: private,
          protected: protected,
          sealed: sealed,
          override: override,
          nullable: nullable,
          comment: comment);

  // ---------------------------------------------------------------------------
  // Function list
  // ---------------------------------------------------------------------------
  CodeFunctionList _functionList;

  // Gets the list of functions belong to this class.
  CodeFunctionList get functionList => _functionList;

  /// Adds a new function to the current class.
  CodeFunction func(Object name,
          {bool abstract,
          bool private,
          bool protected,
          bool sealed,
          bool override,
          String comment,
          String body,
          Function(CodeFunction) let}) =>
      _functionList.func(name,
          abstract: abstract,
          private: private,
          protected: protected,
          sealed: sealed,
          override: override,
          comment: comment,
          body: body,
          let: let);

  // ---------------------------------------------------------------------------
  // Constructor
  // ---------------------------------------------------------------------------
  CodeClazz(
    this._list,
    this.name, {
    this.interface,
    this.abstract,
    this.public,
    this.private,
    this.protected,
    this.sealed,
    String comment,
    Function(CodeClazz) let,
  }) {
    var config = _list._doc._config;
    _comment = CodeComment._(config, comment);
    _clazzList = CodeClazzList(_list._doc, this);
    _fieldList = CodeFieldList(config);
    _functionList = CodeFunctionList(this);
    if (let != null) let(this);
  }
}
