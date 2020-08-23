part of g3.techlab;

class Mustache implements Node, PostRenderer {
  final Node _template;
  final Map<String, StringFunc> functions;
  final Map<String, dynamic> values;

  StringBuffer _templateBuf;
  Map<String, StringBuffer> _nodeBuffers;
  Map<String, dynamic> _rawValues;

  Mustache(this._template, {this.functions, this.values});

  factory Mustache.template(String template,
          {Map<String, StringFunc> functions, Map<String, dynamic> values}) =>
      Mustache(Text.of(template), functions: functions, values: values);

  String Function(LambdaContext) _make(StringFunc func) {
    return (ctx) => func(ctx.renderString());
  }

  @override
  Node build(BuildContext context) {
    _templateBuf = StringBuffer();
    _nodeBuffers = {};
    _rawValues = {};

    final children = <Node>[];

    if (values != null) {
      for (final e in values.entries) {
        final value = e.value;
        final key = e.key;

        if (value is Node) {
          final buf = _nodeBuffers[e.key] = StringBuffer();
          children.add(OutputRedirect(buf, value));
        } else {
          _rawValues[key] = value;
        }
      }
    }

    return Container([
      OutputRedirect(_templateBuf, _template),
      Container(children),
    ]);
  }

  @override
  void postRender(RenderContext context) {
    final defaultFunctions = <String, StringFunc>{
      'upper': StringFuncs.upper,
      'lower': StringFuncs.lower,
      'camel': StringFuncs.camel,
      'pascal': StringFuncs.pascal,
      'snake': StringFuncs.snake,
      'dot': StringFuncs.dot,
      'path': StringFuncs.path,
      'param': StringFuncs.param,
      'header': StringFuncs.header,
      'title': StringFuncs.title,
      'constant': StringFuncs.constant,
    };

    final map = <String, dynamic>{};

    if (defaultFunctions != null) {
      for (final i in defaultFunctions.entries) {
        map[i.key] = _make(i.value);
      }
    }

    if (functions != null) {
      for (final i in functions.entries) {
        map[i.key] = _make(i.value);
      }
    }

    for (final i in _nodeBuffers.entries) {
      map[i.key] = i.value.toString();
    }

    if (values != null) map.addAll(_rawValues);

    final template = Template(_templateBuf.toString());
    template.render(map, context.out);
  }
}
