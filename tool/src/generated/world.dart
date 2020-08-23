part of g3m.stimpack.pacman;

class PacmanWorld with PacmanWorldEx {

}
mixin PacmanWorldEx {
  AuthorScope _author;

  PackageScope _package;

  DependencyScope _dependency;

  AuthorScope get author {
    return _author ??= AuthorScope(this);
  }

  PackageScope get package {
    return _package ?? PackageScope(this);
  }

  DependencyScope get dependency {
    return _dependency ??= DependencyScope(this);
  }
}
