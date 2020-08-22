part of g3m.stimpack.pacman;



class Author extends Expr<Author> {
  final PacmanWorld world;

  Author(this.world):
      super(world.author);

  String _firstName;

  String get firstName {
    return _firstName;
  }

  set firstName(String value) {
    _firstName = value;
    for (var  i in eval()) {
      i._firstName = value;
    }
  }
  String _middleName;

  String get middleName {
    return _middleName;
  }

  set middleName(String value) {
    _middleName = value;
    for (var  i in eval()) {
      i._middleName = value;
    }
  }
  String _lastName;

  String get lastName {
    return _lastName;
  }

  set lastName(String value) {
    _lastName = value;
    for (var  i in eval()) {
      i._lastName = value;
    }
  }
  String _email;

  String get email {
    return _email;
  }

  set email(String value) {
    _email = value;
    for (var  i in eval()) {
      i._email = value;
    }
  }
  // region custom code
// implement custom code here
// ok will implement some thing.

// endregion custom code
}


class AuthorScope extends Scope<Author> {
  final PacmanWorld world;

  AuthorScope(this.world);


  @override
  Author make() {
    return Author(world);
  }

  Author call({String firstName, String middleName, String lastName, String email}) {
    return add(null)
        ..firstName = firstName
        ..middleName = middleName
        ..lastName = lastName
        ..email = email;
  }
}
