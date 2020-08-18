part of g3.armory;

class CodeFieldListConfig extends CodeConfigNode<CodeFieldList> {
  CodeFieldListConfig(NodeBuildFunc<CodeFieldList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFieldListConfig.forJavaLike(Node child) =>
      CodeFieldListConfig((context, param) {
        final children = param.fields;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Container(['\n', Container(children)]);
      }, child);
}

class CodeFieldList extends CodeConfigProxyNode<CodeFieldList> {
  final List<CodeField> fields;

  CodeFieldList._(this.fields);

  static CodeFieldList _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeFieldList>(value, (v) {
      final list = _parseNodeList<CodeField>(v, CodeField._parse);
      if (list != null) return CodeFieldList._(list);
      return null;
    }, error: error);
  }

  factory CodeFieldList.of(dynamic values) {
    return CodeFieldList._parse(values, error: () {
      throw '$values is not a valid field list';
    });
  }
}
