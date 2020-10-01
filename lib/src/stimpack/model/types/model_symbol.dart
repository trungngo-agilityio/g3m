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

  /// Converts the symbol to a model tag, that can be added
  /// as tag to some other model.
  StimModelTag toTag([dynamic name]) {
    return stimpack.model.tag.of(name: name, value: this);
  }

  StimModelTag addValueAsTypeTag(dynamic value) {
    tags ??= {};
    final tag = stimpack.model.tag.withTypeOf(value);
    tags.add(tag);
    return tag;
  }

  StimModelTag setValueAsTypeTag(dynamic value) {
    final tag = stimpack.model.tag.withTypeOf(value);
    tags?.removeWhereNameIs(tag.name);
    tags ??= {};
    tags.add(tag);
    return tag;
  }

  E firstValueOfTypeTag<E>() {
    final tagName = StimModelTagScope.tagNameOfType(E);
    final value = tags?.firstWhereNameIs(tagName)?.value;
    return value == null ? null : value as E;
  }

  Iterable<E> allValuesOfTypeTag<E>() {
    final tagName = StimModelTagScope.tagNameOfType(E);
    return tags
        ?.whereNameIs(tagName)
        ?.map((e) => e.value == null ? null : e.value as E);
  }

  void removeAllTypeTags<E>() {
    final tagName = StimModelTagScope.tagNameOfType(E);
    tags?.removeWhereNameIs(tagName);
  }

  void removeTypeTagOfValue(dynamic value) {
    assert(value != null);
    final tagName = StimModelTagScope.tagNameOfType(value.runtimeType);
    tags?.removeWhere((e) => e.name == tagName && e.value == value);
  }
}
