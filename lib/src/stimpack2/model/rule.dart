part of g3.stimpack2.model;

class StimModelFieldRuleScope {
  StimModelFieldRule

      // Marks a field should unique.
      unique,

      /// Marks that a field is required.
      required,

      /// Marks that a field should be indexed so that database queries
      /// can be applied to the field.
      indexed,

      /// Marks that this is a restricted field. It should be a target
      /// for role based access checking.
      authorized,

      /// Marks that whenever a field is returned, it is readonly.
      /// in the case of apis development, this field should not
      /// be send in any request body. For instance, the id field
      /// is read only for update api.
      readOnly,

      /// Marks that this field is a write only field. An example,
      /// a field password might a write only field.
      writeOnly,

      /// Marks that this field is a system field. It will not be readable
      /// by users or external systems
      systemOnly,

      /// Marks that this field is a detailed field and should be returned
      /// only for detail api / views
      detailedOnly,

      /// Marks that a field should be auto increased.
      autoIncreased,

      /// Marks that the field is transient and should not be persisted
      transient;

  StimModelFieldRule id,
      uuidV4,
      slug,
      ipv4,
      ipv6,
      ip,
      url,
      email,
      username,
      password,
      phone,
      zipCode;

  StimModelFieldRule string, num, bool, duration, uri, date, dateTime, time;

  StimModelFieldRule of({
    @meta.required dynamic name,
    Set<StimModelTag> tags,
    Set<StimModelPattern> patterns,
    Set<StimModelRange> ranges,
  }) {
    return StimModelFieldRule()
      ..name = StimName.of(name)
      ..tags = tags
      ..patterns = patterns
      ..ranges = ranges;
  }
}

class StimModelFieldRule extends StimModelSymbol<StimModelFieldRule> {
  /// The error to be thrown when the rule failed.
  /// This error shall encapsulate related grpc and http status code
  /// if needed.
  StimModelError error;

  /// The list of validation patterns applied to this data field.
  Set<StimModelPattern> patterns;

  /// The list of validation data ranges applied to this data field.
  Set<StimModelRange> ranges;

  StimModelFieldRule();
}
