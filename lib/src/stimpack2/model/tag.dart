part of g3.stimpack2.model;

class StimModelTagScope {
  StimModelTag of({
    @meta.required dynamic name,
    @meta.required dynamic value,
    Iterable<StimModelTag> tags,
  }) =>
      StimModelTag()
        ..name = StimName.of(name)
        ..value = value
        ..tags = tags;
}

/// This provides the flexibility to attach any tags data to any model entity.
/// Tags are just key value pair and can be passed a long from one
/// transformation task to another.
///
class StimModelTag extends StimModelSymbol<StimModelTag> {
  /// Any value can be added to the tag.
  dynamic value;

  StimModelTag();
}
