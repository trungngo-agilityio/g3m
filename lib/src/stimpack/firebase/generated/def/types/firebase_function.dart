part of g3.stimpack.firebase.generated;



class StimFirebaseFunction extends StimModelSymbol<StimFirebaseFunction> {
  StimRbacResource resource;

  StimFirebaseFunction();


  StimFirebaseFunction ref() {
    return StimFirebaseFunctionRef()..symbol = this;
  }

  /// Creates a new "function" of [StimFirebaseFunction] type.
  StimFirebaseFunction refWith({dynamic name, StimRbacResource resource, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (resource != null) {
      res.resource = resource;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimFirebaseFunctionRef extends StimSymbolRef<StimFirebaseFunction> implements StimFirebaseFunction {

}


class StimFirebaseFunctionScope {
  /// Creates a new "function" of [StimFirebaseFunction] type.
  StimFirebaseFunction of({@required
  dynamic name, @required
  StimRbacResource resource, Set<StimModelTag> tags}) {
    return StimFirebaseFunction()
        ..name = StimName.of(name)
        ..resource = resource
        ..tags = tags ?? {};
  }
}
