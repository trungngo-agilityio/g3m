part of g3.techlab;

class CodeFile implements Node, _NamedNode {
  /// The file name without extension.
  @override
  final String name;

  /// The file extension.
  final String extension;

  /// The syntax name. E.g., csharp, java, etc.
  final String syntax;

  /// The file content.
  final Node source;

  /// True indicates that the file need to be overwrite all the time.
  /// False indicates that the file never get overwrite.
  /// null indicates that needs human confirm.
  final bool overwriteIfExists;

  CodeFile({
    @required this.name,
    @required this.extension,
    this.syntax,
    this.source,
    this.overwriteIfExists,
  });

  @override
  Node build(BuildContext context) {
    final placeHolderConfig =
        context.findAncestorNodeOfExactType<CodePlaceHolderConfig>();

    final fileName = '${name}.${extension}';
    if (placeHolderConfig == null) {
      return CodeSyntax(syntax, File.of(fileName, source, overwriteIfExists: overwriteIfExists));
    }

    var path = ioPath.join(context.dir, fileName);
    final relativePath = ioPath.relative(path);

    return CodeSyntax(
      syntax,
      File.of(
        fileName,
        PartialText(
          contentName: '"$relativePath"',
          confirmationNeededOnError: true,
          startMarker: placeHolderConfig.startMarker,
          endMarker: placeHolderConfig.endMarker,
          oldContent: ReadFile(fileName),
          newContent: source,
          onNotEndedBlockError: null,
          onDuplicatedNameBlockError: null,
          onMissingOldBlockError: null,
        ),
        overwriteIfExists: overwriteIfExists,
      ),
    );
  }
}
