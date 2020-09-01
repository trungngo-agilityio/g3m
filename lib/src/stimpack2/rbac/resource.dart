part of g3.stimpack2.rbac;

class StimRbacResourceScope {
  StimRbacResource

      /// This match any resource in the system
      any,

      /// This match a database resource
      database,

      /// This match a database table
      table,

      /// This match a data field
      field,

      /// This match an api
      api,

      /// This match an application
      app,

      /// This match a feature
      feature;

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
