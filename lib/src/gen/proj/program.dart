part of g3.gen;

abstract class Program {
  void load();

  // Builds to the specified project folder.
  void build(ProjectFolder folder);

  void write(ProjectFolder folder);

  void deploy(ProjectFolder folder);
}
