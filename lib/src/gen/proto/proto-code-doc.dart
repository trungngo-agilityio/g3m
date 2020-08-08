part of g3gen;

class ProtoDocConfig {
  final TextConfig text;

  final String version;

  ProtoDocConfig._(this.text, this.version);

  factory ProtoDocConfig.of({TextConfig text, String version}) {
    text ??= TextConfig.useSpace2();
    version ??= '2';
    return ProtoDocConfig._(text, version);
  }
}

class ProtoDoc implements WritableProjectItem {
  final ProtoDocConfig config;

  ProtoDoc._(this.config);

  factory ProtoDoc.of({ProtoDocConfig config}) {
    return ProtoDoc._(config ?? ProtoDocConfig.of());
  }

  @override
  void write(StringSink out) {}
}
