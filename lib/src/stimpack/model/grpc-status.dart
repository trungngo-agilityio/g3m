part of g3.stimpack.model;

/// https://github.com/grpc/grpc/blob/master/doc/statuscodes.md
///
/// Possible values:
/// - 'cancelled': The operation was cancelled (typically by the caller).
/// - 'unknown': Unknown error or an error from a different error domain.
/// - 'invalid-argument': Client specified an invalid argument. Note that this
///   differs from 'failed-precondition'. 'invalid-argument' indicates
///   arguments that are problematic regardless of the state of the system
///   (e.g. an invalid field name).
/// - 'deadline-exceeded': Deadline expired before operation could complete.
///   For operations that change the state of the system, this error may be
///   returned even if the operation has completed successfully. For example,
///   a successful response from a server could have been delayed long enough
///   for the deadline to expire.
/// - 'not-found': Some requested document was not found.
/// - 'already-exists': Some document that we attempted to create already
///   exists.
/// - 'permission-denied': The caller does not have permission to execute the
///   specified operation.
/// - 'resource-exhausted': Some resource has been exhausted, perhaps a
///   per-user quota, or perhaps the entire file system is out of space.
/// - 'failed-precondition': Operation was rejected because the system is not
///   in a state required for the operation's execution.
/// - 'aborted': The operation was aborted, typically due to a concurrency
///   issue like transaction aborts, etc.
/// - 'out-of-range': Operation was attempted past the valid range.
/// - 'unimplemented': Operation is not implemented or not supported/enabled.
/// - 'internal': Internal errors. Means some invariants expected by
///   underlying system has been broken. If you see one of these errors,
///   something is very broken.
/// - 'unavailable': The service is currently unavailable. This is most likely
///   a transient condition and may be corrected by retrying with a backoff.
/// - 'data-loss': Unrecoverable data loss or corruption.
/// - 'unauthenticated': The request does not have valid authentication
///   credentials for the operation.
class StimModelGrpcStatusScope {
  StimModelGrpcStatus ok0,
      cancelled1,
      unknown2,
      invalidArgument3,
      deadlineExceeded4,
      notFound5,
      alreadyExists6,
      permissionDenied7,
      resourceExhausted8,
      failedPrecondition9,
      aborted10,
      outOfRange11,
      unimplemented12,
      internal13,
      unavailable14,
      dataLoss15,
      unauthenticated16;

  StimModelGrpcStatus of({
    @meta.required dynamic name,
    @meta.required int code,
    @meta.required StimModelHttpStatus httpStatus,
    Set<StimModelTag> tags,
  }) =>
      StimModelGrpcStatus()
        ..name = StimName.of(name)
        ..code = code
        ..httpStatus = httpStatus
        ..tags = tags;
}

class StimModelGrpcStatus extends StimModelSymbol<StimModelGrpcStatus> {
  /// The grpc status code.
  int code;

  /// The related http status code.
  StimModelHttpStatus httpStatus;

  StimModelGrpcStatusRef _ref;

  /// Gets the reference to this model.
  StimModelGrpcStatus get ref =>
      _ref ??= StimModelGrpcStatusRef()..symbol = this;

  StimModelGrpcStatus();
}

class StimModelGrpcStatusRef extends StimSymbolRef<StimModelGrpcStatus>
    implements StimModelGrpcStatus {}
