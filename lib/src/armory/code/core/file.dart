part of g3.armory;

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

  CodeFile({
    @required this.name,
    @required this.extension,
    this.syntax,
    this.source,
  });

  @override
  Node build(BuildContext context) {
    // Parsing for code custom
    final codeFileName = '${name}.${extension}';
    final path = ioPath.join(context.dir, codeFileName);
    var codeSyntax = CodeSyntax(syntax, source);

    final file = io.File(path);
    if (file.existsSync()) {
      final markers = _parseCustomCodeMarkers(context, file, path);
      if (markers?.isNotEmpty == true) {
        return PartialFile(
          codeFileName,
          markers: markers,
          newContentFirst: true,
          content: codeSyntax,
        );
      }
    }

    // Don't have any custom code.
    return File(codeFileName, codeSyntax);
  }

  List<String> _parseCustomCodeMarkers(
      BuildContext context, io.File file, String path) {
    // Parsing for code custom.
    final content = file.readAsStringSync();
    final customConfig =
        context.dependOnAncestorNodeOfExactType<CodeCustomConfig>();

    // The is the list of markers discovered from the existing file.
    final markers = <String>[];

    // Looks for all code custom config markers
    var done = false;
    var k = 0;

    final startMarker = customConfig.startMarker;
    final endMarker = customConfig.endMarker;
    while (!done) {
      var startIdx = content.indexOf(startMarker, k);
      if (startIdx < 0) {
        // cannot find any start marker.
        done = true;
      } else {
        var endIdx = -1;

        // find the end of the custom code marker.
        k = startIdx + startMarker.length;
        var lineEndIdx = content.indexOf('\n', k);

        if (lineEndIdx >= 0) {
          // Adds the start marker to the marker list.
          markers.add(content.substring(startIdx, lineEndIdx));

          // Starts looking for the end marker.
          k = lineEndIdx + 1;
          endIdx = content.indexOf(endMarker, k);

          if (endIdx >= 0) {
            k = endIdx + endMarker.length;
            var lineEndIdx = content.indexOf('\n', k);
            if (lineEndIdx < 0) lineEndIdx = content.length;
            // found a line end
            // Adds the end marker to the marker list.
            markers.add(content.substring(endIdx, lineEndIdx));
            k = lineEndIdx + 1;
          }
        }

        if (endIdx < 0) {
          checkAbort(context, path);

          // Don't generate code for this file.
          return null;
        }
      }
    }

    return markers;
  }

  void checkAbort(BuildContext context, String path) {
    final relativePath = ioPath.relative(path);

    // The content has been modified. Need to prompt.
    final abort = 'Yes. abort';
    final skip =
        'No, skip generating this file and i will fix the issue later.';
    final options = {
      'y': abort,
      'n': skip,
    };

    final message =
        '$relativePath file has invalid custom code marker without an end.'
        ' Do you want to abort?';

    // Prompt user to see what they want to do with the file.
    final choice = prompts.choose(
      message,
      options.values,
      defaultsTo: abort,
      names: options.keys,
    );

    if (choice == abort) {
      // Abort rendering.
      context.abort();
    } else {
      // Skips the file.
      print('$relativePath has been skipped.');
    }
  }
}
