part of g3gen;

/// Defines sub file in the project.
class ProjectFile extends ProjectItem {
  final String _path;
  final String _name;

  final WritableProjectItem _item;

  ProjectFile(this._path, this._name, this._item);

  @override
  bool get isEmpty => null;

  @override
  String get name => _name;

  bool _written = false;

  void _write() async {
    if (_item == null || _written) return;
    _written = true;

    final file = File(_path);
    var out = file.openWrite();
    _item.write(out);
    await out.flush();
    await out.close();
  }

  @override
  void delete() {
    if (!_written) return;
    final file = File(_path);
    file.deleteSync(recursive: false);
  }

  void _copyTo(ProjectFolder folder) {
    if (!_written) return;

    final file = File(_path);

    var outFile = file.copySync(ioPath.join(folder._dir, name));
    print(outFile.path);
  }
}
