part of g3.techlab;

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

  /// True indicates that the file need to be overwrite all the time.
  /// False indicates that the file never get overwrite.
  /// null indicates that needs human confirm.
  final bool overwriteIfExists;

  // The internal string buffer that captures all children's output.
  StringBuffer _buf;

  bool _ignored;

  /// Create a new file with the specified file [name].
  /// The file path is related to the directory specified by the nearest
  /// [Directory] ancestor.
  ///
  File._(this.name, this.content, this.overwriteIfExists)
      : assert(name?.isNotEmpty == true, 'name is required');

  factory File.of(String name, Node content, {bool overwriteIfExists}) {
    return File._(name, content, overwriteIfExists);
  }

  factory File.confirmOverwrite(String name, Node content) {
    return File._(name, content, null);
  }

  factory File.alwaysOverwrite(String name, Node content) {
    return File._(name, content, true);
  }

  factory File.neverOverwrite(String name, Node content) {
    return File._(name, content, false);
  }

  @override
  Node build(BuildContext context) {
    context.file = ioPath.join(context.dir, name);
    _ignored = GlobIgnore.isIgnored(context, context.file);
    if (_ignored) return null;

    return content;
  }

  @override
  void render(RenderContext context) {
    if (_ignored == true) return;

    // Redirect all children's output to the new string buffer.
    _buf = StringBuffer();
    context.out = _buf;
  }

  @override
  void postRender(RenderContext context) async {
    final path = context.file;
    final relativePath = ioPath.relative(path);

    if (_ignored == true) {
      printWarn('$relativePath file is ignored');
      return;
    }

    final file = io.File(path);
    final content = _buf.toString();
    _buf = null;

    if (!file.existsSync()) {
      printInfo('$relativePath has been generated.');
    } else {
      // Reads out the existing content to compare with the latest
      // content. If the content has been modified, prompt the user
      // to see if they want to overwrite it.
      final existingContent = file.readAsStringSync();

      if (existingContent == content) {
        // The content has not been modified, just skip it.
        print('$relativePath has not been modified.');
      } else if (overwriteIfExists == false) {
        printWarn(
            '$relativePath has been modified, but skipped because of hard settings.');
        return;
      } else if (overwriteIfExists == true || context.yesToAll == true) {
        printInfo('$relativePath has been overwritten.');
      } else {
        // The content has been modified. Need to prompt.
        final no = 'No, skip it.';
        final yes = 'Yes. Overwrite';
        final yesToAll = 'Yes and stop asking. Overwrite everything';
        final abort = 'Abort';
        final options = {
          'n': no,
          'y': yes,
          '*': yesToAll,
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
          printWarn('$relativePath has been skipped.');
          return;
        } else if (choice == yesToAll) {
          // Overwrite the file.
          printWarn('$relativePath and all other changes will be overwrite.');
          context.yesToAll = true;
        } else {
          printInfo('$relativePath has been overwritten.');
        }
      }
    }

    file.writeAsStringSync(content, flush: true);
  }
}
