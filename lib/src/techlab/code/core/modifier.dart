part of g3.techlab;

class CodeModifierConfig extends CodeConfigNode<CodeModifier> {
  CodeModifierConfig(NodeBuildFunc<CodeModifier> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeModifierConfig.forTypescriptLike(Node child) {
    return CodeModifierConfig._internal(
      child,
      overrideKeyword: null,
      factoryKeyword: null,
      privateKeyword: 'private ',
      publicKeyword: 'export ',
      protectedKeyword: 'protected ',
      internalKeyword: null,
      abstractKeyword: 'abstract ',
      staticKeyword: 'static ',
      finalKeyword: 'const ',
      optionalKeyword: null,
      asyncKeyword: 'async ',
    );
  }

  factory CodeModifierConfig.forJavaLike(Node child) {
    return CodeModifierConfig._internal(
      child,
      overrideKeyword: null,
      factoryKeyword: null,
      privateKeyword: 'private ',
      publicKeyword: 'public ',
      protectedKeyword: 'protected ',
      internalKeyword: null,
      abstractKeyword: 'abstract ',
      staticKeyword: 'static ',
      finalKeyword: null,
      optionalKeyword: null,
      asyncKeyword: null,
    );
  }

  factory CodeModifierConfig.forDartLike(Node child) {
    return CodeModifierConfig._internal(
      child,
      overrideKeyword: null,
      factoryKeyword: 'factory ',
      privateKeyword: null,
      publicKeyword: null,
      protectedKeyword: null,
      internalKeyword: null,
      abstractKeyword: 'abstract ',
      staticKeyword: 'static ',
      finalKeyword: 'final ',
      optionalKeyword: null,
      asyncKeyword: null,
    );
  }

  factory CodeModifierConfig._internal(
    Node child, {
    @required String overrideKeyword,
    @required String factoryKeyword,
    @required String privateKeyword,
    @required String publicKeyword,
    @required String protectedKeyword,
    @required String internalKeyword,
    @required String abstractKeyword,
    @required String staticKeyword,
    @required String finalKeyword,
    @required String optionalKeyword,
    @required String asyncKeyword,
  }) =>
      CodeModifierConfig((context, access) {
        final keywords = <String>[];

        if (access.isOverride == true && overrideKeyword != null) {
          keywords.add(overrideKeyword);
        }

        if (access.isFactory == true && factoryKeyword != null) {
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

        if (access.isAbstract == true && abstractKeyword != null) {
          keywords.add(abstractKeyword);
        }

        if (access.isStatic == true && staticKeyword != null) {
          keywords.add(staticKeyword);
        }

        if (access.isFinal == true && finalKeyword != null) {
          keywords.add(finalKeyword);
        }

        if (access.isOptional == true && optionalKeyword != null) {
          keywords.add(optionalKeyword);
        }

        if (access.isAsync == true && asyncKeyword != null) {
          keywords.add(asyncKeyword);
        }

        if (keywords.isEmpty) return null;

        return Container(keywords);
      }, child);
}

class CodeModifier extends CodeConfigProxyNode<CodeModifier> {
  final bool isOverride;
  final bool isFactory;
  final bool isPrivate;
  final bool isPublic;
  final bool isProtected;
  final bool isInternal;

  final bool isAbstract;
  final bool isStatic;
  final bool isFinal;

  final bool isOptional;
  final bool isAsync;

  CodeModifier({
    this.isOverride,
    this.isFactory,
    this.isPrivate,
    this.isPublic,
    this.isProtected,
    this.isInternal,
    this.isAbstract,
    this.isStatic,
    this.isFinal,
    this.isOptional,
    this.isAsync,
  });
}
