part of g3.stimpack.model.generated;

/// This function is called during the initialization of model
void stimInitModelPack(StimModel pack) {
  StimModelPackInit(pack);
}

class StimModelPackInit {
  final StimModel pack;

  StimModelPackInit(this.pack) {
    _initPatterns();
    _initRules();
    _initFields();
  }

  void _initPatterns() {}

  void _initRules() {
    _initValidationRules();
  }

  void _initValidationRules() {
    final p = pack.pattern.forValidation, r = pack.rule.forValidation;
    r.password.patterns += p.password;
    r.id.patterns += p.id;
    r.uuidV4.patterns += p.uuidV4;
  }

  void _initFields() {
    final tGrpc = pack.type.forGrpc,
        tDate = pack.type.forDate,
        f = pack.field.forDb;
    f.id + f.version
      ..type.set(tGrpc.string);

    f.modifiedAt + f.createdAt
      ..type.set(tDate.timestamp);
  }
}
