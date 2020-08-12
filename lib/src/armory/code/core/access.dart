part of g3.armory;

class CodeAccessConfig extends CodeConfigNode<CodeAccess> {
  CodeAccessConfig(NodeBuildFunc<CodeAccess> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeAccessConfig.of(
    Node child, {
    String privateKeyword = 'private',
    String publicKeyword = 'public',
    String protectedKeyword = 'protected',
    String internalKeyword = 'internal',
    String abstractKeyword = 'abstract',
    String staticKeyword = 'static',
  }) =>
      CodeAccessConfig((context, access) {
        final keywords = <String>[];

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

        return Text.of(keywords.join(' '));
      }, child);
}

class CodeAccess extends CodeConfigProxyNode<CodeAccess> {
  final bool private;
  final bool public;
  final bool protected;
  final bool internal;

  final bool abstract;
  final bool static;

  CodeAccess({
    this.private,
    this.public,
    this.protected,
    this.internal,
    this.abstract,
    this.static,
  });

  factory CodeAccess.private() => CodeAccess(private: true);

  factory CodeAccess.protected() => CodeAccess(protected: true);

  factory CodeAccess.internal() => CodeAccess(internal: true);

  factory CodeAccess.public() => CodeAccess(public: true);

  factory CodeAccess.privateAbstract() =>
      CodeAccess(private: true, abstract: true);

  factory CodeAccess.protectedAbstract() =>
      CodeAccess(protected: true, abstract: true);

  factory CodeAccess.internalAbstract() =>
      CodeAccess(internal: true, abstract: true);

  factory CodeAccess.publicAbstract() =>
      CodeAccess(public: true, abstract: true);

  factory CodeAccess.privateStatic() => CodeAccess(private: true, static: true);

  factory CodeAccess.protectedStatic() =>
      CodeAccess(protected: true, static: true);

  factory CodeAccess.internalStatic() =>
      CodeAccess(internal: true, static: true);

  factory CodeAccess.publicStatic() => CodeAccess(public: true, static: true);
}
