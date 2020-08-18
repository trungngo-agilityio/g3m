part of g3m.core.dep;


class Author extends Expr<Author> {
  @override
  final AuthorScope scope;

  Author(this.scope):
      super(scope);

  Dependency _author;


  Dependency get author {
    return _author;
  }

   set author(Dependency value) {
    _author = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._author = value;
    }
  }
}


class AuthorScope extends Scope<Author> {
  final DependencyScope author;

  AuthorScope(this.author);


  @override
  Author make() {
    return Author(this)
        ..author = author.none;
  }

  Author call(Dependency author) {
    return add(this)
        ..author = author;
  }
}
