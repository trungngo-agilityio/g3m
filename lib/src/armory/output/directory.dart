part of g3.armory;

enum _DirectoryPathKind {
  absolute,
  relative,
  temp,
}

class Directory extends SingleChildNode implements Renderer {
  /// The relative or absolute path, depending on the path [_kind].
  final String _path;

  final _DirectoryPathKind _kind;

  Directory._(this._path, this._kind, Node child) : super(child);

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

  /// On render, redirect the current render context directory
  /// to somewhere else.
  ///
  @override
  void render(RenderContext context) {
    String dir;
    if (_kind == _DirectoryPathKind.temp) {
      // Creates a new temp directory.
      dir = io.Directory.systemTemp.createTempSync(_path).path;
    } else {
      if (_kind == _DirectoryPathKind.absolute) {
        dir = ioPath.absolute(_path);
      } else {
        dir = ioPath.absolute(context.path, _path);
      }

      // Creates the directory
      io.Directory(dir).createSync(recursive: true);
    }

    // Redirects the output directory to the new one.
    // All sub sequence file output will be written to here.
    context.path = dir;
  }
}
