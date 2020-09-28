part of g3.stimpack.func.init;

class _StimFuncMapCode extends StimModelFuncCode {
  final StimFuncMap func;

  _StimFuncMapCode(this.func);

  @override
  CodeFunction gen() {
    return CodeFunction.of(name: func.name);
  }
}

extension StimFuncMapperExtension on StimFuncMapScope {
  StimFuncMap autoMapOf({
    @required StimModelType from,
    @required StimModelType to,
  }) {
    assert(from != null, 'from is required');
    assert(to != null, 'to is required');

    final name = 'map' >> from.name >> 'to' >> to.name;
    Node body;

     CodeFunction.of(
      name: name,
      requiredArgs: from.name,
      returns: to.name,
      body: body,
    );
  }
}

class _StimFuncFilterCode extends StimModelFuncCode {
  final StimFuncMap func;

  _StimFuncFilterCode(this.func);

  @override
  CodeFunction gen() {
    return CodeFunction.of(name: func.name);
  }
}

extension StimFuncFilterExtension on StimFuncFilterScope {}
