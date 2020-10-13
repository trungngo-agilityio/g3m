part of g3.stimpack.nx.init;

extension OnWorkspaceScopeNxExtension on StimNxWorkspaceScope {
  StimNxWorkspace fromPath({
    dynamic name,
    @required String path,
    bool exists,
  }) {
    assert(path?.isNotEmpty == true, 'path is required');
    name ??= io_path.basename(path);

    /// Opens a new repo project for the workspace
    final project = stimpack.repo.project.fromPath(
      path: path,
      exists: exists,
    );

    final rootDir = project.path;

    return of(
      name: name,
      project: project,
      libsDir: rootDir.childDir(path: 'libs'),
      libs: null,
      appsDir: rootDir.childDir(path: 'apps'),
      apps: null,
    );
  }
}

extension OnWorkspaceNxExtension on StimNxWorkspace {
  StimNxLib addLib({
    dynamic name,
    bool exists,
    String path,
    Set<StimModelTag> tags,
  }) {
    assert(project != null, 'repo project must be set before calling this.');

    name ??= StimName.of(path).param();
    final lib = stimpack.nx.lib.of(
      name: name,
      workspace: this,
      repo: null,
      tags: tags,
    );

    lib.repo = project.childRepoOf(
      name: StimName.refOf(lib),
      path: io_path.join('libs', path),
      exists: exists,
    );

    libs += lib;
    return lib;
  }

  StimNxApp addApp({
    @required dynamic name,
    bool exists,
    @required String path,
    Set<StimModelTag> tags,
  }) {
    assert(name != null, 'name is required');
    assert(path != null, 'path is required');
    assert(project != null, 'project must be set before calling this.');

    name = StimName.of(name).param();
    final app = stimpack.nx.app.of(
      name: name,
      workspace: this,
      repo: null,
      tags: tags,
    );

    app.repo = project.childRepoOf(
      name: StimName.refOf(app),
      path: io_path.join('apps', path),
      exists: exists,
    );

    apps += app;
    return app;
  }

  StimIoDir get path => project?.path;

  bool get exists => path?.exists;
}
