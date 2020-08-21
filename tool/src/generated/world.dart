part of g3m.tool.generated;



class ToolWorld {
  AuthorScope _author;

  PackageScope _package;

  DependencyScope _dependency;


  ToolWorld() {
    _author = AuthorScope(this);
    _package = PackageScope(this);
    _dependency = DependencyScope(this);
  }

  AuthorScope get author {
    return _author;
  }
  PackageScope get package {
    return _package;
  }
  DependencyScope get dependency {
    return _dependency;
  }
}
