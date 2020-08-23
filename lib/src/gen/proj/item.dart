part of g3.gen;

abstract class ProjectItem {
  /// The project item name.
  String get name;

  /// True indicates that project item is empty.
  bool get isEmpty;

  /// Delete the project folder recursively.
  void delete();
}

abstract class BuildableProjectItem {
  void build();
}

abstract class WritableProjectItem {
  void write(StringSink out);
}

abstract class ReadableProjectItem {
  void read();
}
