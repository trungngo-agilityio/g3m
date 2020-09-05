part of g3.stimpack.rest.generated;



class StimRestCrudApi extends StimModelSymbol<StimRestCrudApi> {
  StimModelType model;

  StimModelField idField;

  StimRestCrudCreateOneApi createOne;

  StimRestCrudUpdateOneApi updateOne;

  StimRestCrudFindOneApi findOne;

  StimRestCrudDeleteOneApi deleteOne;

  StimRestCrudFindApi find;

  StimRestCrudDeleteApi delete;

  StimRestCrudApi();


  StimRestCrudApi ref() {
    return StimRestCrudApiRef()..symbol = this;
  }

  /// Creates a new "crudApi" of [StimRestCrudApi] type.
  StimRestCrudApi refWith({dynamic name, StimModelType model, StimModelField idField, StimRestCrudCreateOneApi createOne, StimRestCrudUpdateOneApi updateOne, StimRestCrudFindOneApi findOne, StimRestCrudDeleteOneApi deleteOne, StimRestCrudFindApi find, StimRestCrudDeleteApi delete, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (model != null) {
      res.model = model;
    }

    if (idField != null) {
      res.idField = idField;
    }

    if (createOne != null) {
      res.createOne = createOne;
    }

    if (updateOne != null) {
      res.updateOne = updateOne;
    }

    if (findOne != null) {
      res.findOne = findOne;
    }

    if (deleteOne != null) {
      res.deleteOne = deleteOne;
    }

    if (find != null) {
      res.find = find;
    }

    if (delete != null) {
      res.delete = delete;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimRestCrudApiRef extends StimSymbolRef<StimRestCrudApi> implements StimRestCrudApi {

}


class StimRestCrudApiScope {
  /// Creates a new "crudApi" of [StimRestCrudApi] type.
  StimRestCrudApi of({dynamic name, StimModelType model, @required
  StimModelField idField, StimRestCrudCreateOneApi createOne, StimRestCrudUpdateOneApi updateOne, StimRestCrudFindOneApi findOne, StimRestCrudDeleteOneApi deleteOne, StimRestCrudFindApi find, StimRestCrudDeleteApi delete, Set<StimModelTag> tags}) {
    return StimRestCrudApi()
        ..name = StimName.of(name)
        ..model = model
        ..idField = idField
        ..createOne = createOne
        ..updateOne = updateOne
        ..findOne = findOne
        ..deleteOne = deleteOne
        ..find = find
        ..delete = delete
        ..tags = tags ?? {};
  }
}
