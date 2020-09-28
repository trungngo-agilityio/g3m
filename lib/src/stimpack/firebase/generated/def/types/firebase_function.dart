part of g3.stimpack.firebase.generated;



class StimFirebaseFunction extends StimModelSymbol<StimFirebaseFunction> {
  StimRbacResource resource;

  StimFirebaseFunction();


  /// Creates a new "function" of [StimFirebaseFunction] type.
  StimFirebaseFunction copyWith({@required
  dynamic name, @required
  StimRbacResource resource, Set<StimModelTag> tags}) {
    return StimFirebaseFunction()
        ..name = StimName.of(name ?? this.name)
        ..resource = resource ?? this.resource
        ..tags = tags ?? this.tags;
  }
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
