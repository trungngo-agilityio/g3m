part of g3m.ex;

class World {
  PatternScopeEx pattern;
  ConstraintScopeEx constraint;
  DataTypeScopeEx type;
  FieldScopeEx field;
  ModelScopeEx model;
  ErRelationCardinalScopeEx relationCardinal;
  ErRelationTypeScopeEx relationType;
  ErRelationScopeEx relation;
  DbEngineScopeEx engine;
  DbSchemaScopeEx schema;
  DbTableScopeEx table;
  ActorScopeEx actor;
  ActionScopeEx action;
  StoryScopeEx story;

  World(
      {this.pattern,
      this.constraint,
      this.type,
      this.field,
      this.model,
      this.relationCardinal,
      this.relationType,
      this.relation,
      this.engine,
      this.schema,
      this.table,
      this.actor,
      this.action,
      this.story}) {
    pattern ??= PatternScopeEx();
    constraint ??= ConstraintScopeEx(pattern);
    type ??= DataTypeScopeEx(constraint);
    field ??= FieldScopeEx(type, constraint);
    model ??= ModelScopeEx(field);
    relationCardinal ??= ErRelationCardinalScopeEx();
    relationType ??= ErRelationTypeScopeEx(relationCardinal);
    relation ??= ErRelationScopeEx(model, relationType);
    engine ??= DbEngineScopeEx();
    schema ??= DbSchemaScopeEx();
    table ??= DbTableScopeEx(engine, schema, model, field);
    actor ??= ActorScopeEx();
    action ??= ActionScopeEx();
    story ??= StoryScopeEx(actor, action, model, table);
  }
}
