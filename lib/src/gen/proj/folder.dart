part of g3gen;

/// Defines a folder that include many sub [ProjectFile].
///
class ProjectFolder extends ProjectItem {
  final String _dir;
  final String _name;

  ProjectFolder._(this._dir, this._name);

  /// The internal project files.
  final Set<ProjectFile> _files = {};

  /// Gets out the files stored in this folder.
  ///
  Iterable<ProjectFile> get files => _files;

  /// Gets out the list of folders inside the project.
  final Set<ProjectFolder> _folders = {};

  /// Gets out the list of folders
  Iterable<ProjectFolder> get folders => _folders;

  /// Creates a new sub folder
  ProjectFolder newFolder(String name) {
    var folder = ProjectFolder._(ioPath.join(_dir, name), name);
    _folders.add(folder);
    return folder;
  }

  /// Creates a new project file.
  ProjectFile newFile(String name, [WritableProjectItem item]) {
    var file = ProjectFile(ioPath.join(_dir, name), name, item);
    _files.add(file);
    return file;
  }

  @override
  bool get isEmpty => false;

  @override
  String get name => _name;

  void _write() async {
    _ensureExists();

    for (var i in _files) {
      await i._write();
    }
    for (var i in _folders) {
      await i._write();
    }
  }

  void _ensureExists() {
    var dir = Directory(_dir);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
  }

  @override
  void delete() {
    for (var i in _files) {
      i.delete();
    }
    for (var i in _folders) {
      i.delete();
    }

    var dir = Directory(_dir);
    if (dir.existsSync()) {
      try {
        dir.deleteSync(recursive: false);
      } catch (e) {
        // Just ignore
      }
    }
  }

  void _copyTo(ProjectFolder folder) {
    folder._ensureExists();

    for (var i in files) {
      i._copyTo(folder);
    }

    for (var i in _folders) {
      i._copyTo(folder.newFolder(i.name));
    }
  }
}
