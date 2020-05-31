part of g3gen;

// -----------------------------------------------------------------------------
// Field list
// -----------------------------------------------------------------------------
class CodeFieldList with IterableMixin<CodeField> {
  final CodeConfig _config;

  final List<CodeField> _list = [];

  CodeFieldList(this._config);

  CodeField field(Object name, Object type,
      {Object initializer,
      int index,
      bool abstract,
      bool private,
      bool protected,
      bool sealed,
      bool override,
      String comment}) {
    var f = CodeField(this, name?.toString(), type?.toString(), initializer,
        index, abstract, private, protected, sealed, override, comment);
    _list.add(f);
    return f;
  }

  @override
  Iterator<CodeField> get iterator => _list.iterator;
}

// -----------------------------------------------------------------------------
// Field
// -----------------------------------------------------------------------------

class CodeField {
  final CodeFieldList _list;

  /// The field name.
  String name;

  /// The field type.
  String type;

  /// The field initializer.
  Object initializer;

  // ---------------------------------------------------------------------------

  /// Sort index, can be used to sort the fields.  Also, for proto indexing.
  int index;

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

  CodeComment _comment;

  /// This is the comment for the field.
  CodeComment get comment => _comment;

  CodeField(
      this._list,
      this.name,
      this.type,
      this.initializer,
      this.index,
      this.abstract,
      this.private,
      this.protected,
      this.sealed,
      this.override,
      String comment) {
    _comment = CodeComment._(_list._config, comment);
  }
}
