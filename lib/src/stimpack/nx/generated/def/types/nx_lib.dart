part of g3.stimpack.nx.generated;



class StimNxLib extends StimModelSymbol<StimNxLib> {
  /// The parent project
  StimNxWorkspace workspace;

  /// The repo pack repository object.
  StimRepoRepository repo;

  StimNxLib();


  /// Creates a new "lib" of [StimNxLib] type.
  StimNxLib copyWith({@required
  dynamic name, @required
  StimNxWorkspace workspace, StimRepoRepository repo, Set<StimModelTag> tags}) {
    return StimNxLib()
        ..name = StimName.of(name ?? this.name)
        ..workspace = workspace ?? this.workspace
        ..repo = repo ?? this.repo
        ..tags = tags ?? this.tags;
  }
}


class StimNxLibScope {
  /// Creates a new "lib" of [StimNxLib] type.
  StimNxLib of({@required
  dynamic name, @required
  StimNxWorkspace workspace, StimRepoRepository repo, Set<StimModelTag> tags}) {
    return StimNxLib()
        ..name = StimName.of(name)
        ..workspace = workspace
        ..repo = repo
        ..tags = tags ?? {};
  }
}
