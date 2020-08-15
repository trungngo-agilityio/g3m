part of g3.armory;

/// This node captures all children's output to a file.
///
/// Important: Child nodes such as [OutputRedirect], [Console],
/// [File] might redirect the output to some where else.
///
class File implements Node, Renderer, PostRenderer {
  // The file name.
  final String name;

  // The file content.
  final Node content;

  // The internal string buffer that captures all children's output.
  StringBuffer _buf;

  /// Create a new file with the specified file [name].
  /// The file path is related to the directory specified by the nearest
  /// [Directory] ancestor.
  ///
  File(this.name, this.content);

  @override
  Node build(BuildContext context) {
    context.file = ioPath.join(context.dir, name);
    return content;
  }

  @override
  void render(RenderContext context) {
    // Redirect all children's output to the new string buffer.
    _buf = StringBuffer();
    context.out = _buf;
  }

  @override
  void postRender(RenderContext context) async {
    final path = context.file;
    final relativePath = ioPath.relative(path);

    final file = io.File(path);
    final content = _buf.toString();
    _buf = null;

    if (!file.existsSync()) {
      print('$relativePath has been generated.');
    } else {
      // Reads out the existing content to compare with the latest
      // content. If the content has been modified, prompt the user
      // to see if they want to overwrite it.
      final existingContent = file.readAsStringSync();

      if (existingContent == content) {
        // The content has not been modified, just skip it.
        print('$relativePath not modified.');
      } else {
        // The content has been modified. Need to prompt.
        final yes = 'Yes. Overwrite';
        final no = 'No, skip it.';
        final abort = 'Abort';
        final options = {
          'y': yes,
          'n': no,
          'a': abort,
        };

        final message =
            '$relativePath file has been modified. Do you want to overwrite?';

        // Prompt user to see what they want to do with the file.
        final choice = prompts.choose(
          message,
          options.values,
          defaultsTo: no,
          names: options.keys,
        );

        if (choice == abort) {
          // Abort rendering.
          context.abort();
          return;
        } else if (choice == no) {
          // Skips the file.
          print('$relativePath has been skipped.');
          return;
        } else {
          // Overwrite the file.
          print('$relativePath has been overwritten.');
        }
      }
    }

    file.writeAsStringSync(content, flush: true);
  }
}
