part of g3.stimpack.core;

class Story extends Expr<Story> {
  @override
  final StoryScope _scope;

  Story(this._scope) : super(_scope);

  // ---------------------------------------------------------------------------
  // Actor
  // ---------------------------------------------------------------------------
  Actor _actor;

  Actor get actor => _actor ?? _scope._actor.none;

  // ---------------------------------------------------------------------------
  // Action
  // ---------------------------------------------------------------------------
  Action _action;

  Action get action => _action ?? _scope._action.none;

  // ---------------------------------------------------------------------------
  // Request
  // ---------------------------------------------------------------------------
  Field _request;

  Field get request => _request ?? _scope._model._field.none;

  set request(Field value) {
    eval().forEach((e) => e._request = value);
  }

  // ---------------------------------------------------------------------------
  // Response
  // ---------------------------------------------------------------------------
  Field _response;

  Field get response => _response ?? _scope._model._field.none;

  set response(Field value) {
    eval().forEach((e) => e._response = value);
  }

  // ---------------------------------------------------------------------------
  // Table
  // ---------------------------------------------------------------------------
  DbTable _table;

  DbTable get table => _table ?? _scope._table.none;

  set table(DbTable value) {
    eval().forEach((e) => e._table = value);
  }

  Story filterByActor(Actor actor) {
    return filter((t) => actor.contains(t.actor));
  }

  Story filterByAction(Action actor) {
    return filter((t) => action.contains(t.action));
  }

  Story filterByTable(DbTable table) {
    return filter((t) => table.contains(t.table));
  }
}

class StoryScope extends Scope<Story> {
  final ActorScope _actor;
  final ActionScope _action;
  final ModelScope _model;
  final DbTableScope _table;

  StoryScope(this._actor, this._action, this._model, this._table);

  @override
  Story make() => Story(this);

  Story call(Actor actor, Action action,
      {Field request, Field response, DbTable table}) {
    assert(actor != null && actor.eval().isNotEmpty, 'actor argument required');
    assert(
        action != null && action.eval().isNotEmpty, 'action argument required');

    var res = none;
    for (var actorEl in actor.eval()) {
      for (var actionEl in action.eval()) {
        // -------------------------------------------------------------------
        // This is a user story without a related model.
        //
        var name = actorEl.name & actionEl.name;
        res += add(name)
          .._actor = actorEl
          .._action = actionEl
          .._request = request
          .._response = response;
      }
    }

    return res;
  }
}
