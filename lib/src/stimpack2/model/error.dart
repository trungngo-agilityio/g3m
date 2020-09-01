part of g3.stimpack2.model;

/// We are modeling restful api errors following the grpc error modeling
/// so that it is easy to convert back and forth between the two.
///
class StimModelErrorScope {
  StimModelError of({
    @meta.required dynamic name,
    int code,
    String message,
    StimModelGrpcStatus grpcStatus,
    StimModelHttpStatus httpStatus,
    Set<StimModelTag> tags,
  }) =>
      StimModelError()
        ..name = StimName.of(name)
        ..code = code
        ..message = message
        ..grpcStatus = grpcStatus
        ..httpStatus = httpStatus
        ..tags = tags;
}

class StimModelError extends StimModelSymbol<StimModelError> {
  /// The custom defined error code. This code, together with
  /// the custom message shall be serialized in a http or grpc
  /// error response body.
  int code;

  /// Additional string message to be displayed.
  String message;

  /// The grpc status in the case this error is propagate through a
  /// grpc context.
  StimModelGrpcStatus grpcStatus;

  /// Optional. It is important to note that the http status should be
  /// automated populated via [StimModelGrpcStatus.httpStatus] field.
  /// This field should only be set if there is a need to overwrite the
  /// http status.
  StimModelHttpStatus httpStatus;

  StimModelError();
}
