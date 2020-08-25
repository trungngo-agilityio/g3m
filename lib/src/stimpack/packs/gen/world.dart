part of g3m.stimpack.meta;

class MetaWorld {
  MetaTermScope _metaTerm;

  MetaPackScope _metaPack;

  MetaFieldScope _metaField;

  MetaTypeScope _metaType;

  MetaRelationScope _metaRelation;

  MetaRelationTypeScope _metaRelationType;

  MetaWorld() {
    _metaTerm = MetaTermScope(this);
    _metaPack = MetaPackScope(this);
    _metaField = MetaFieldScope(this);
    _metaType = MetaTypeScope(this);
    _metaRelation = MetaRelationScope(this);
    _metaRelationType = MetaRelationTypeScope(this);
  }

  MetaTermScope get metaTerm {
    return _metaTerm;
  }

  MetaPackScope get metaPack {
    return _metaPack;
  }

  MetaFieldScope get metaField {
    return _metaField;
  }

  MetaTypeScope get metaType {
    return _metaType;
  }

  MetaRelationScope get metaRelation {
    return _metaRelation;
  }

  MetaRelationTypeScope get metaRelationType {
    return _metaRelationType;
  }
// region custom code of world
  /// write anything here
// endregion custom code of world
}
