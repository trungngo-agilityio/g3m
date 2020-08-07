part of g3gen;

// -----------------------------------------------------------------------------
// Import list
// -----------------------------------------------------------------------------

class CodeImportList with IterableMixin<CodeImport> {
  /// The list of import for this document.
  final List<CodeImport> _list = [];

  CodeImportList();

  CodeImport import({String package, List<String> types, String alias}) {
    final v = CodeImport(package: package, types: types, alias: alias);
    _list.add(v);
    return v;
  }

  @override
  Iterator<CodeImport> get iterator => _list.iterator;
}

// -----------------------------------------------------------------------------
// Import
// -----------------------------------------------------------------------------

class CodeImport {
  final String package;
  final String alias;

  final List<String> types;

  CodeImport({
    this.package,
    this.alias,
    this.types,
  }) : assert(package != null);
}
