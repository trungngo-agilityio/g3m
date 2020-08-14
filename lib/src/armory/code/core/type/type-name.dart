part of g3.armory;

class CodeTypeNameMapperConfig extends SingleChildNode {
  final Map<String, String> map;

  CodeTypeNameMapperConfig(Node child, this.map)
      : assert(map != null),
        super(child);

  @override
  Node build(BuildContext context) {
    final parent =
        context.findAncestorNodeOfExactType<CodeTypeNameMapperConfig>();
    if (parent != null && parent.map != null) {
      // Merges parent settings
      for (final i in parent.map.entries) {
        map.putIfAbsent(camel(i.key), () => i.value);
      }
    }

    return super.build(context);
  }

  String translate(String name) {
    final key = camel(name);
    return map.containsKey(key) ? map[key] : name;
  }
}

class CodeTypeNameConfig extends CodeConfigNode<CodeTypeName> {
  CodeTypeNameConfig(NodeBuildFunc<CodeTypeName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeTypeNameConfig.of(StringFunc func, Node child) =>
      CodeTypeNameConfig((context, name) {
        final mapperConfig =
            context.findAncestorNodeOfExactType<CodeTypeNameMapperConfig>();

        return TextTransform(name.content, (s) {
          s = func(s);
          return mapperConfig?.translate(s) ?? s;
        });
      }, child);

  factory CodeTypeNameConfig.forJavaLike(Node child) =>
      CodeTypeNameConfig.of(pascal, child);
}

class CodeTypeName extends CodeConfigProxyNode<CodeTypeName> {
  final Node content;

  CodeTypeName(this.content);

  factory CodeTypeName.of(String text) {
    return text == null ? null : CodeTypeName(Text.of(text));
  }
}
