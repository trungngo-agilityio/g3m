part of g3m.stimpack.pacman;



class PacmanWorld {
  AuthorScope _author;

  PackageScope _package;

  DependencyScope _dependency;


  PacmanWorld() {
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
