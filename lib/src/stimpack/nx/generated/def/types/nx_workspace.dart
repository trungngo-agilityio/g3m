part of g3.stimpack.nx.generated;



class StimNxWorkspace extends StimModelSymbol<StimNxWorkspace> {
  StimRepoProject project;

  /// The libs directory that contains all nx libraries
  StimIoDir libsDir;

  /// The apps directory that contains all nx applications.
  StimIoDir appsDir;

  /// All libraries defined in this nx workspace.
  Set<StimNxLib> libs;

  /// All applications defined in this nx workspace.
  Set<StimNxApp> apps;

  StimNxWorkspace();


  /// Creates a new "workspace" of [StimNxWorkspace] type.
  StimNxWorkspace copyWith({@required
  dynamic name, @required
  StimRepoProject project, @required
  StimIoDir libsDir, @required
  StimIoDir appsDir, @required
  Set<StimNxLib> libs, @required
  Set<StimNxApp> apps, Set<StimModelTag> tags}) {
    return StimNxWorkspace()
        ..name = StimName.of(name ?? this.name)
        ..project = project ?? this.project
        ..libsDir = libsDir ?? this.libsDir
        ..appsDir = appsDir ?? this.appsDir
        ..libs = libs ?? this.libs
        ..apps = apps ?? this.apps
        ..tags = tags ?? this.tags;
  }
}


class StimNxWorkspaceScope {
  /// Creates a new "workspace" of [StimNxWorkspace] type.
  StimNxWorkspace of({@required
  dynamic name, @required
  StimRepoProject project, @required
  StimIoDir libsDir, @required
  StimIoDir appsDir, @required
  Set<StimNxLib> libs, @required
  Set<StimNxApp> apps, Set<StimModelTag> tags}) {
    return StimNxWorkspace()
        ..name = StimName.of(name)
        ..project = project
        ..libsDir = libsDir
        ..appsDir = appsDir
        ..libs = libs ?? {}
        ..apps = apps ?? {}
        ..tags = tags ?? {};
  }
}
