part of g3.stimpack.repo.init;

extension OnProjectScopeRepoExtension on StimRepoProjectScope {
  StimRepoProject fromPath({
    dynamic name,
    @required String path,
    bool exists,
    Set<StimModelTag> tags,
  }) {
    assert(path?.isNotEmpty == true, 'path is required');
    final projectDir = stimpack.io.dir.absoluteDirOf(
      path: path,
      exists: true,
    );

    name = name ?? projectDir.name;

    final project = of(
      name: name,
      path: projectDir,
    );

    projectDir._project = project;

    return project;
  }
}

extension OnProjectExtension on StimRepoProject {
  StimRepoRepository childRepoOf({
    dynamic name,
    bool exists,
    @required String path,
    StimRepoManifest manifest,
    Set<StimModelTag> tags,
  }) {
    assert(path?.isNotEmpty == true, 'path is required');
    final projectPath = this.path;
    assert(projectPath != null, 'the project path is required');

    final repoDir = projectPath.childDir(
      path: path,
      exists: exists,
    );

    final repo = stimpack.repo.repository.of(
      name: name,
      project: this,
      path: repoDir,
      parentRepo: null,
      tags: tags,
    );

    repoDir._repo = repo;
    return repo;
  }
}
