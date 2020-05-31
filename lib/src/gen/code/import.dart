part of g3gen;

// -----------------------------------------------------------------------------
// Import list
// -----------------------------------------------------------------------------

class CodeImportList {
  final CodeDoc _doc;

  /// The list of import for this document.
  final List<CodeImport> _list = [];

  CodeImportList(this._doc);
}

// -----------------------------------------------------------------------------
// Import
// -----------------------------------------------------------------------------

class CodeImport {}
