part of g3.techlab;

/// Generates a `.keep` file as the parent node's directory.
///
class DotKeepFile implements Node {
  @override
  Node build(BuildContext context) {
    return File('.keep', null);
  }
}
