part of g3.stimpack.semver.init;

/// This function is called during the initialization of semver
void _stimInitSemverPack() {
  _initVersions();
  _initVersionRanges();
}

void _initVersions() {
  final v = stimpack.semver.version;
  v.latest = v.of(name: 'latest', major: null, minor: null);
}

void _initVersionRanges() {
  final v = _semver.version;
  final r = _semver.versionRange;

  r.any = r.of(name: 'any');
}
