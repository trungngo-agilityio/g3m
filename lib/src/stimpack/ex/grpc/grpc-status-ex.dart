part of g3.stimpack.ex;

class GRpcStatusScopeEx extends GRpcStatusScope {
  GRpcStatus ok0,
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

  GRpcStatusScopeEx(HttpStatusScopeEx httpStatuses) {
    ok0 = call('ok', 0, httpStatuses.ok200);
    cancelled1 = call('cancelled', 1, httpStatuses.clientCloseRequest499);
    unknown2 = call('unknown', 2, httpStatuses.internalServerError500);
    invalidArgument3 = call('invalid argument', 3, httpStatuses.badRequest400);
    deadlineExceeded4 =
        call('deadline exceed', 4, httpStatuses.gatewayTimeout504);
    notFound5 = call('not found', 5, httpStatuses.notFound404);
    alreadyExists6 = call('already exists', 6, httpStatuses.conflict409);
    permissionDenied7 = call('permission denied', 7, httpStatuses.forbidden403);
    resourceExhausted8 =
        call('resource exhausted', 8, httpStatuses.tooManyRequest429);
    failedPrecondition9 =
        call('failed precondition', 9, httpStatuses.badRequest400);
    aborted10 = call('aborted', 10, httpStatuses.conflict409);
    outOfRange11 = call('out of range', 11, httpStatuses.badRequest400);
    unimplemented12 = call('unimplemented', 12, httpStatuses.badRequest400);
    internal13 = call('internal', 13, httpStatuses.internalServerError500);
    unavailable14 = call('unavailable', 14, httpStatuses.serviceUnavailable503);
    dataLoss15 = call('data loss', 15, httpStatuses.internalServerError500);
    unauthenticated16 =
        call('unauthenticated', 16, httpStatuses.unauthorized401);
  }
}
