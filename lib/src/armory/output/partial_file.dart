part of g3.armory;

class PartialFile implements Node {
  // The file name.
  final String name;

  // The file content.
  final Node content;

  final List<String> markers;

  /// If this is true, the new content shall be used for any text
  /// before the first marker.
  final bool newContentFirst;

  /// The file path is related to the directory specified by the nearest
  /// [Directory] ancestor.
  ///
  PartialFile(
    this.name, {
    @required this.markers,
    @required this.content,
    this.newContentFirst = false,
  })  : assert(markers != null, 'markers is required'),
        assert(markers.length % 2 == 0, 'markers must be an even list');

  @override
  Node build(BuildContext context) {
    context.file = ioPath.join(context.dir, name);

    return File(
        name,
        TextBlend(
          markers: markers,
          oldContent: ReadFile(name),
          newContent: content,
          newContentFirst: newContentFirst,
        ));
  }
}
