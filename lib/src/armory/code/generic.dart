part of g3.armory;

class CodeGenericParamConfig extends CodeConfigNode<CodeGenericParam> {
  CodeGenericParamConfig(NodeBuildFunc<CodeGenericParam> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeGenericParamConfig.javaLike(Node child) =>
      CodeGenericParamConfig((context, param) {
        if (param.extend == null) {
          return PascalCase(param.name);
        } else {
          return Container([
            PascalCase(param.name),
            Text(' extends '),
            param.extend,
          ]);
        }
      }, child);
}

class CodeGenericParam extends CodeConfigProxyNode<CodeGenericParam> {
  final Node name;
  final CodeDataType extend;

  CodeGenericParam(this.name, {this.extend});
}

class CodeGenericParamListConfig extends CodeConfigNode<CodeGenericParamList> {
  CodeGenericParamListConfig(
      NodeBuildFunc<CodeGenericParamList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeGenericParamListConfig.javaLike(Node child) =>
      CodeGenericParamListConfig((context, param) {
        final children = param.children;
        if (children == null || children.isEmpty) {
          return null;
        }

        final res = <Node>[Text('<'), children[0]];
        for (var i = 1; i < children.length; i++) {
          res.add(Text(', '));
          res.add(children[i]);
        }
        res.add(Text('>'));

        return Container(res);
      }, child);
}

class CodeGenericParamList extends CodeConfigProxyNode<CodeGenericParamList> {
  final List<CodeGenericParam> children;

  CodeGenericParamList(this.children);
}
