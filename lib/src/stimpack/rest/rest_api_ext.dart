part of g3.stimpack.rest.init;

extension OnRestApiScopeExt on StimRestApiScope {
  // TODO: Documentation
  StimRestApi forModel({
    dynamic name,
    StimRbacPolicy policy,
    StimModelPackage package,
    dynamic requestName,
    bool requestStreamed,
    @required StimModelType model,
    dynamic responseName,
    bool responseStreamed,
    Set<StimModelTag> tags,
  }) {
    assert(model != null, 'model is required');
    package ??= model.package;

    return forFieldSet(
      name: name ?? model.name,
      policy: policy,
      package: package,
      requestName: requestName,
      requestStreamed: requestStreamed,
      request: model.fields,
      responseName: responseName,
      responseStreamed: responseStreamed,
      response: model.fields,
      tags: tags,
    );
  }

  // TODO: Documentation
  StimRestApi forFieldSet({
    @required dynamic name,
    StimRbacPolicy policy,
    @required StimModelPackage package,
    dynamic requestName,
    bool requestStreamed,
    @required Set<StimModelField> request,
    dynamic responseName,
    bool responseStreamed,
    @required Set<StimModelField> response,
    Set<StimModelTag> tags,
  }) {
    assert(name != null, 'name is required');
    assert(package != null, 'package is required');

    // Default the request and response name if that are not pased in.
    name = StimName.of(name);
    requestName ??= name >> 'request';
    responseName ??= name >> 'response';

    final rest = stimpack.rest;

    final apiRequest = rest.apiRequest.forFieldSet(
      name: requestName,
      streamed: requestStreamed,
      package: package,
      fields: request,
    );

    final apiResponse = rest.apiResponse.forFieldSet(
      name: responseName,
      streamed: responseStreamed,
      package: package,
      fields: response,
    );

    final res = rest.api.of(
      name: name,
      request: apiRequest,
      response: apiResponse,
      policy: policy,
      tags: tags,
    );

    return res;
  }
}
