part of g3.stimpack.rbac.init;

extension StimRbacPolicyExtensions on StimRbacPolicyScope {
  StimRbacPolicy deny({
    dynamic name,
    @required Set<StimRbacResource> resources,
    @required Set<StimRbacAction> actions,
    Set<StimRbacCondition> conditions,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      kind: stimpack.rbac.policyKind.deny,
      resources: resources,
      actions: actions,
      conditions: conditions,
      tags: tags,
    );
  }

  StimRbacPolicy allow({
    dynamic name,
    @required Set<StimRbacResource> resources,
    @required Set<StimRbacAction> actions,
    @required Set<StimRbacCondition> conditions,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      kind: stimpack.rbac.policyKind.allow,
      resources: resources,
      actions: actions,
      conditions: conditions,
      tags: tags,
    );
  }
}

extension StimRbacResourceExtensions on StimRbacResourceScope {
  StimRbacResource databaseOf({@required dynamic id, Set<StimModelTag> tags}) {
    assert(id != null, 'id is required');

    id = stimpack.rbac.resourceId.of(name: id);
    assert(id.name?.isNotEmpty == true, 'id name cannot be empty');

    return of(
      name: StimName.refOf(id) >> 'database',
      id: id,
      parent: stimpack.rbac.resource.database,
      tags: tags,
    );
  }

  StimRbacResource dataTableOf(
      {@required dynamic id,
      @required StimRbacResource database,
      Set<StimModelTag> tags}) {
    assert(id != null, 'id is required');

    id = stimpack.rbac.resourceId.of(name: id);
    assert(id.name?.isNotEmpty == true, 'id name cannot be empty');

    assert(dataTable != null, 'database is required');

    return of(
      name: StimName.refOf(id) >> 'table of ' >> StimName.refOf(database),
      id: id,
      parent: database,
      tags: tags,
    );
  }

  StimRbacResource dataFieldOf(
      {@required dynamic id,
      @required StimRbacResource dataTable,
      Set<StimModelTag> tags}) {
    assert(id != null, 'id is required');

    id = stimpack.rbac.resourceId.of(name: id);
    assert(id.name?.isNotEmpty == true, 'id name cannot be empty');

    assert(dataTable != null, 'data table is required');

    return of(
      name: StimName.refOf(id) >> 'data field of ' >> StimName.refOf(dataTable),
      id: id,
      parent: dataTable,
      tags: tags,
    );
  }

  StimRbacResource serviceOf({@required dynamic id, Set<StimModelTag> tags}) {
    assert(id != null, 'id is required');

    id = stimpack.rbac.resourceId.of(name: id);
    assert(id.name?.isNotEmpty == true, 'id name cannot be empty');

    return of(
      name: StimName.refOf(id) >> 'service',
      id: id,
      parent: stimpack.rbac.resource.service,
      tags: tags,
    );
  }

  StimRbacResource subServiceOf(
      {@required dynamic id,
      @required StimRbacResource parentService,
      Set<StimModelTag> tags}) {
    assert(id != null, 'id is required');

    id = stimpack.rbac.resourceId.of(name: id);
    assert(id.name?.isNotEmpty == true, 'id name cannot be empty');

    assert(parentService != null, 'parentService is required');

    return of(
      name:
          StimName.refOf(id) >> 'service of ' >> StimName.refOf(parentService),
      id: id,
      parent: parentService,
      tags: tags,
    );
  }

  StimRbacResource serviceApiOf(
      {@required dynamic id,
      @required StimRbacResource service,
      Set<StimModelTag> tags}) {
    assert(id != null, 'id is required');

    id = stimpack.rbac.resourceId.of(name: id);
    assert(id.name?.isNotEmpty == true, 'id name cannot be empty');

    assert(service != null, 'service is required');

    return of(
      name: StimName.refOf(id) >> 'api of ' >> StimName.refOf(service),
      id: id,
      parent: service,
      tags: tags,
    );
  }

  StimRbacResource appOf({@required dynamic id, Set<StimModelTag> tags}) {
    assert(id != null, 'id is required');

    id = stimpack.rbac.resourceId.of(name: id);
    assert(id.name?.isNotEmpty == true, 'id name cannot be empty');

    return of(
      name: StimName.refOf(id) >> 'app',
      id: id,
      parent: stimpack.rbac.resource.app,
      tags: tags,
    );
  }

  StimRbacResource appFeatureOf(
      {@required dynamic id,
      @required StimRbacResource app,
      Set<StimModelTag> tags}) {
    assert(id != null, 'id is required');

    id = stimpack.rbac.resourceId.of(name: id);
    assert(id.name?.isNotEmpty == true, 'id name cannot be empty');

    assert(app != null, 'app is required');

    return of(
      name: StimName.refOf(id) >> 'app',
      id: id,
      parent: app,
      tags: tags,
    );
  }
}
