part of g3.armory;

class CodeModifierConfig extends CodeConfigNode<CodeModifier> {
  CodeModifierConfig(NodeBuildFunc<CodeModifier> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeModifierConfig.forJavaLike(
    Node child, {
    String overrideKeyword = '@override\n',
    String factoryKeyword,
    String privateKeyword = 'private ',
    String publicKeyword = 'public ',
    String protectedKeyword = 'protected ',
    String internalKeyword = 'internal ',
    String abstractKeyword = 'abstract ',
    String staticKeyword = 'static ',
  }) =>
      CodeModifierConfig((context, access) {
        final keywords = <String>[];

        if (access.override == true && overrideKeyword != null) {
          keywords.add(overrideKeyword);
        }

        if (access.factory == true && factoryKeyword != null) {
          keywords.add(factoryKeyword);
        }

        if (access.private == true && privateKeyword != null) {
          keywords.add(privateKeyword);
        }

        if (access.public == true && publicKeyword != null) {
          keywords.add(publicKeyword);
        }

        if (access.protected == true && protectedKeyword != null) {
          keywords.add(protectedKeyword);
        }

        if (access.internal == true && internalKeyword != null) {
          keywords.add(internalKeyword);
        }

        if (access.abstract == true && abstractKeyword != null) {
          keywords.add(abstractKeyword);
        }

        if (access.static == true && staticKeyword != null) {
          keywords.add(staticKeyword);
        }

        if (keywords.isEmpty) return null;

        return Container(keywords);
      }, child);
}

class CodeModifier extends CodeConfigProxyNode<CodeModifier> {
  final bool override;
  final bool factory;
  final bool private;
  final bool public;
  final bool protected;
  final bool internal;

  final bool abstract;
  final bool static;

  CodeModifier({
    this.override,
    this.factory,
    this.private,
    this.public,
    this.protected,
    this.internal,
    this.abstract,
    this.static,
  });
}
