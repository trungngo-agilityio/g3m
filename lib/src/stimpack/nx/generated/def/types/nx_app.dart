part of g3.stimpack.nx.generated;



class StimNxApp extends StimModelSymbol<StimNxApp> {
  /// The parent project
  StimNxWorkspace workspace;

  /// The repo pack repository object.
  StimRepoRepository repo;

  StimNxApp();


  /// Creates a new "app" of [StimNxApp] type.
  StimNxApp copyWith({@required
  dynamic name, @required
  StimNxWorkspace workspace, @required
  StimRepoRepository repo, Set<StimModelTag> tags}) {
    return StimNxApp()
        ..name = StimName.of(name ?? this.name)
        ..workspace = workspace ?? this.workspace
        ..repo = repo ?? this.repo
        ..tags = tags ?? this.tags;
  }
}


class StimNxAppScope {
  /// Creates a new "app" of [StimNxApp] type.
  StimNxApp of({@required
  dynamic name, @required
  StimNxWorkspace workspace, @required
  StimRepoRepository repo, Set<StimModelTag> tags}) {
    return StimNxApp()
        ..name = StimName.of(name)
        ..workspace = workspace
        ..repo = repo
        ..tags = tags ?? {};
  }
}
