part of g3.armory;

enum _DirectoryPathKind {
  absolute,
  relative,
  temp,
}

/// This node helps to redirect the children's output stream to
/// a new directory.
///
/// Usage:
/// - [Directory.absolute] creates a new directory node that
/// redirects all children's output to an absolute directory.
///
class Directory implements Node {
  /// The relative or absolute path, depending on the path [_kind].
  final String _path;

  final _DirectoryPathKind _kind;

  final Node _child;

  Directory._(this._path, this._kind, this._child);

  /// Redirect all file output to the specified absolute [path].
  ///
  factory Directory.absolute(String path, Node child) {
    return Directory._(path, _DirectoryPathKind.absolute, child);
  }

  /// Redirects all file output to the specified [path] that is
  /// relative to the current path of the render context.
  ///
  factory Directory.relative(String path, Node child) {
    return Directory._(path, _DirectoryPathKind.relative, child);
  }

  /// Redirects all file output to the specified [path] that is
  /// relative to the system temp directory.
  ///
  factory Directory.temp(String path, Node child) {
    return Directory._(path, _DirectoryPathKind.temp, child);
  }

  @override
  Node build(BuildContext context) {
    String path;

    if (_kind == _DirectoryPathKind.temp) {
      // Creates a new temp directory.
      path = io.Directory.systemTemp.createTempSync(_path).path;
    } else {
      if (_kind == _DirectoryPathKind.absolute) {
        path = ioPath.absolute(_path);
      } else {
        // Gets the path that is relative to the context.
        path = ioPath.absolute(context.dir, _path);
      }

      // Creates the directory
      final dir = io.Directory(path);
      dir.createSync(recursive: true);
      path = dir.absolute.path;
    }

    // Redirects the output directory to the new one.
    // All sub sequence file output will be written to here.
    context.dir = path;
    return _child;
  }
}
