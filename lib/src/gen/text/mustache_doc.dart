part of g3gen;

class MustacheDoc implements WritableProjectItem {
  /// The internal compiled template.
  final Template template;

  // The values to be sent of rendering.
  final dynamic values;

  MustacheDoc(this.template, this.values);

  factory MustacheDoc.of(String template, dynamic values) {
    assert(template != null);
    return MustacheDoc(Template(template), values);
  }

  @override
  void write(StringSink out) {
    template.render(values, out);
  }
}
