part of g3.stimpack.model;

class StimModelSymbol<T extends StimModelSymbol<T>> extends StimSymbol<T>
    implements StimNamed {
  /// All model symbol should have a name.
  @override
  StimName name;

  /// All things in the models should have tags.
  Set<StimModelTag> tags;

  StimModelSymbol();

  StimModelSymbol.of(this.name, {this.tags});

  StimModelTag toTag() {
    final tagName = runtimeType.toString();
    return StimModelTag()
      ..name = StimName.of(tagName)
      ..value = this;
  }

  StimModelTag addSymbolAsTag(StimModelSymbol symbol) {
    tags ??= {};
    final tag = symbol.toTag();
    tags.add(tag);
    return tag;
  }

  void removeTaggedSymbol(StimModelSymbol symbol) {
    if (tags?.isNotEmpty != true) return;
    final tagName = StimName.of(symbol.runtimeType.toString());
    return tags.removeWhere((e) => e.name == tagName && e.value == symbol);
  }

  E firstTaggedSymbolOfExactType<E>() {
    final tagName = E.toString();
    final value = tags?.firstWhereNameIs(tagName)?.value;
    return value == null ? null : value as E;
  }

  Set<E> allTaggedSymbolsOfExactType<E>() {
    final tagName = E.toString();
    final symbolTags = tags?.whereNameIs(tagName);
    return symbolTags
        ?.map((e) => e.value == null ? null : e.value as E)
        ?.toSet();
  }

  @override
  String toString() {
    return '${runtimeType}{name: $name}';
  }
}
