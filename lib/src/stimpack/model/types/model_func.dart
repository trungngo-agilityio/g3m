part of g3.stimpack.model;

/// Builds the code for the function.
abstract class StimModelFuncCode extends StimGen<CodeFunction> {}

class StimModelFuncs {}

class StimModelFuncScope {
  /// The model functions.
  StimModelFuncs model;

  StimModelFunc of({
    @meta.required dynamic name,
    @meta.required StimModelType inType,
    @meta.required StimModelType outType,
    @meta.required StimModelFuncCode code,
    Set<StimModelError> errors,
    Set<StimModelTag> tags,
  }) {
    return StimModelFunc()
      ..name = StimName.of(name)
      ..inType = inType
      ..inType = inType
      ..outType = outType
      ..errors = errors ?? {}
      ..code = code
      ..tags = tags;
  }
}

class StimModelFunc extends StimModelSymbol<StimModelFunc> {
  // The data type that this field has.
  StimModelType inType;
  StimModelType outType;
  Set<StimModelError> errors;
  StimModelFuncCode code;

  /// Gets the reference to this model.
  StimModelFunc ref() => StimModelFuncRef()..symbol = this;

  StimModelFunc refWith({
    dynamic name,
    Set<StimModelTag> tags,
    StimModelType inType,
    StimModelType outType,
    Set<StimModelError> errors,
  }) {
    final res = ref();
    if (name != null) res.name = StimName.of(name);
    if (tags != null) res.tags = tags;
    if (inType != null) res.inType = inType;
    if (outType != null) res.outType = outType;
    if (errors != null) res.errors = errors;
    return res;
  }

  StimModelFunc();
}

class StimModelFuncRef extends StimSymbolRef<StimModelFunc>
    implements StimModelFunc {}
