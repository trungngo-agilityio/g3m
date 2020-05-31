part of g3gen;

/// Defines a project structure.
///
class Project {
  /// The root folder of the project.
  ///
  ProjectFolder _rootFolder;
  ProjectFolder _tempFolder;

  /// The program to execute.
  Program _program;

  /// Gets the project root folder.
  ProjectFolder get root {
    return _rootFolder;
  }

  ProjectFolder _outFolder;

  /// The project out folder.
  ProjectFolder get outFolder => _outFolder;

  bool _load = false;
  bool _built = false;
  bool _wrote = false;
  bool _deployed = false;

  /// Opens a new project at the specified source root and a handler to
  /// load build up the project's world.
  ///
  Project.open(Program program, String path) {
    var tempDir = Directory.systemTemp.createTempSync('g3').path;
    _tempFolder = ProjectFolder._(tempDir, 'temp');
    _outFolder = _tempFolder.newFolder('out');

    _rootFolder = ProjectFolder._(path, '\$');
    _program = program;
  }

  /// Loads up the program source. This will build the world's AST.
  ///
  bool load() {
    if (_load) return false;
    _load = true;

    _program.load();
    return true;
  }

  /// Cleans the project.
  ///
  void clean() {
    _load = false;
    _outFolder.delete();
  }

  /// Builds the entire project.
  void build() {
    if (_built) return;
    if (!_load) load();
    _program.build(_outFolder);
    _built = true;
  }

  /// Writes the project output to file system.
  ///
  void write() async {
    if (_wrote) return;
    if (!_built) build();

    // Writes out all existing files
    _wrote = true;
    await _outFolder._write();

    _program.write(_outFolder);
  }

  /// Deploys the generated files to the project's output directory.
  void deploy() async {
    if (_deployed) return;
    if (!_wrote) await write();

    _deployed = true;

    // Copy the output folder to the final location.
    _outFolder._copyTo(_rootFolder);

    // Deletes the temp directory once the copy is done.
    _tempFolder.delete();

    _program.deploy(_rootFolder);
  }
}
