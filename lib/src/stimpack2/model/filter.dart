part of g3.stimpack2.model;

class StimModelFieldFilterScope {
  Set<StimModelFieldFilter> stringFilters,
      numberFilters,
      rangeFilters,
      dateFilters,
      dateTimeFilters,
      timeFilters;

  StimModelFieldFilter isNull, isIn;
  StimModelFieldFilter exact,
      iExact,
      startsWith,
      iStartsWith,
      endsWith,
      iEndsWith,
      contains,
      iContains,
      regex;

  StimModelFieldFilter gt, gte, lt, lte, range;

  StimModelFieldFilter ago,
      date,
      year,
      month,
      day,
      week,
      weekDay,
      quarter,
      time,
      hour,
      minute,
      second;

  StimModelFieldFilter of({
    @meta.required dynamic name,
    Set<StimModelTag> tags,
  }) =>
      StimModelFieldFilter()
        ..name = StimName.of(name)
        ..tags = tags;
}

class StimModelFieldFilter extends StimModelSymbol<StimModelFieldFilter> {
  StimModelFieldFilter();
}
