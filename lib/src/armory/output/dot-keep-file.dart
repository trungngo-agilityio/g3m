part of g3.armory;

class DotKeepFile implements Node {
  @override
  Node build(BuildContext context) {
    return File('.keep', null);
  }
}
