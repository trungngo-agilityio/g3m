part of g3.stimpack2.rbac;

class StimRbacResourceScope {
  StimRbacResource any, database, dataTable, api, app, feature;

  StimRbacResource of({
    @required dynamic name,
    StimRbacResource parent,
    Set<StimModelTag> tags,
  }) =>
      StimRbacResource()
        ..name = StimName.of(name)
        ..parent = database
        ..tags = tags;

  /// Creates a specific database resource, with the specified [name]
  StimRbacResource ofDatabase({
    @required dynamic name,
    StimRbacResource parent,
    Set<StimModelTag> tags,
  }) =>
      of(name: name, parent: database, tags: tags);
}

class StimRbacResource extends StimModelSymbol<StimRbacResource> {
  /// The parent resource.
  StimRbacResource parent;

  StimRbacResource();
}
