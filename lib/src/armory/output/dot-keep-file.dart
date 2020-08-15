part of g3.armory;

/// Generates a `.keep` file as the parent node's directory.
///
class DotKeepFile implements Node {
  @override
  Node build(BuildContext context) {
    return File('.keep', null);
  }
}
