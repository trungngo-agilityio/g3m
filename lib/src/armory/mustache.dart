part of g3.armory;

class Mustache extends NoChildNode implements Renderer {
  final Template template;

  final dynamic values;

  Mustache(this.template, this.values);

  factory Mustache.of(String template, dynamic values) =>
      Mustache(Template(template), values);

  @override
  void render(RenderContext context) {
    template.render(values, context.out);
  }
}
