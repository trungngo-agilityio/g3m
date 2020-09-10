part of g3.stimpack.model;

class StimModelFilterScope {
  Set<StimModelFilter> stringFilters,
      numberFilters,
      boolFilters,
      collectionFilters,
      rangeFilters,
      dateFilters,
      dateTimeFilters,
      timeFilters;

  StimModelFilter isNull, isNotNull, isEmpty, isNotEmpty, isIn, isNotIn;
  StimModelFilter isExact,
      isNotExact,
      isCaseInsensitiveExact,
      startsWith,
      caseInsensitiveStartsWith,
      endsWith,
      caseInsensitiveEndsWith,
      contains,
      caseInsensitiveContains,
      matchesRegex;

  StimModelFilter greaterThan,
      greaterThanOrEqual,
      lessThan,
      lessThanOrEqual,
      isInRange;

  StimModelFilter ago,
      isDate,
      isYear,
      isMonth,
      isDay,
      isWeek,
      isWeekDay,
      isQuarter,
      isTime,
      isHour,
      isMinute,
      isSecond;

  StimModelFilter of({
    @meta.required dynamic name,
    Set<StimModelTag> tags,
  }) =>
      StimModelFilter()
        ..name = StimName.of(name)
        ..tags = tags;
}

class StimModelFilter extends StimModelSymbol<StimModelFilter> {
  /// Gets the reference to this model.
  StimModelFilter ref() => StimModelFieldFilterRef()..symbol = this;

  StimModelFilter();
}

class StimModelFieldFilterRef extends StimSymbolRef<StimModelFilter>
    implements StimModelFilter {}
