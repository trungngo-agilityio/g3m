part of g3m.ex;

class WorldEx {
  PatternScopeEx _pattern;

  PatternScopeEx get pattern => _pattern ??= PatternScopeEx();

  ConstraintScopeEx _constraint;

  ConstraintScopeEx get constraint =>
      _constraint ??= ConstraintScopeEx(pattern);

  DataTypeScopeEx _type;

  DataTypeScopeEx get type => _type ??= DataTypeScopeEx(constraint);

  FieldScopeEx _field;

  FieldScopeEx get field => _field ??= FieldScopeEx(type, constraint);

  ModelScopeEx _model;

  ModelScopeEx get model => _model ??= ModelScopeEx(field);

  ErRelationCardinalScopeEx _erRelationCardinal;

  ErRelationCardinalScopeEx get erRelationCardinal =>
      _erRelationCardinal ??= ErRelationCardinalScopeEx();

  ErRelationTypeScopeEx _erRelationType;

  ErRelationTypeScopeEx get erRelationType =>
      _erRelationType ??= ErRelationTypeScopeEx(erRelationCardinal);

  ErRelationScopeEx _erRelation;

  ErRelationScopeEx get erRelation =>
      _erRelation ??= ErRelationScopeEx(model, erRelationType);

  DbEngineScopeEx _dbEngine;

  DbEngineScopeEx get dbEngine => _dbEngine ??= DbEngineScopeEx();

  DbSchemaScopeEx _dbSchema;

  DbSchemaScopeEx get dbSchema => _dbSchema ??= DbSchemaScopeEx();

  DbTableScopeEx _dbTable;

  DbTableScopeEx get dbTable =>
      _dbTable ??= DbTableScopeEx(dbEngine, dbSchema, model, field);

  StoryActorScopeEx _storyActor;

  StoryActorScopeEx get storyActor => _storyActor ??= StoryActorScopeEx();

  StoryActionScopeEx _storyAction;

  StoryActionScopeEx get storyAction => _storyAction ??= StoryActionScopeEx();

  StoryScopeEx _story;

  StoryScopeEx get story =>
      _story ??= StoryScopeEx(storyActor, storyAction, model, dbTable);
}
