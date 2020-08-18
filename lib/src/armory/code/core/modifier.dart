part of g3.armory;

class CodeModifierConfig extends CodeConfigNode<CodeModifier> {
  CodeModifierConfig(NodeBuildFunc<CodeModifier> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeModifierConfig.forJavaLike(
    Node child, {
    String overrideKeyword,
    String factoryKeyword,
    String privateKeyword = 'private ',
    String publicKeyword = 'public ',
    String protectedKeyword = 'protected ',
    String internalKeyword = 'internal ',
    String abstractKeyword = 'abstract ',
    String staticKeyword = 'static ',
    String finalKeyword = 'final ',
  }) =>
      CodeModifierConfig((context, access) {
        final keywords = <String>[];

        if (access.override == true && overrideKeyword != null) {
          keywords.add(overrideKeyword);
        }

        if (access.factory == true && factoryKeyword != null) {
          keywords.add(factoryKeyword);
        }

        if (access.isPrivate == true && privateKeyword != null) {
          keywords.add(privateKeyword);
        }

        if (access.isPublic == true && publicKeyword != null) {
          keywords.add(publicKeyword);
        }

        if (access.isProtected == true && protectedKeyword != null) {
          keywords.add(protectedKeyword);
        }

        if (access.isInternal == true && internalKeyword != null) {
          keywords.add(internalKeyword);
        }

        if (access.abstract == true && abstractKeyword != null) {
          keywords.add(abstractKeyword);
        }

        if (access.static == true && staticKeyword != null) {
          keywords.add(staticKeyword);
        }

        if (access.isFinal == true && finalKeyword != null) {
          keywords.add(finalKeyword);
        }

        if (keywords.isEmpty) return null;

        return Container(keywords);
      }, child);
}

class CodeModifier extends CodeConfigProxyNode<CodeModifier> {
  final bool override;
  final bool factory;
  final bool isPrivate;
  final bool isPublic;
  final bool isProtected;
  final bool isInternal;

  final bool abstract;
  final bool static;
  final bool isFinal;

  CodeModifier({
    this.override,
    this.factory,
    this.isPrivate,
    this.isPublic,
    this.isProtected,
    this.isInternal,
    this.abstract,
    this.static,
    this.isFinal,
  });
}
