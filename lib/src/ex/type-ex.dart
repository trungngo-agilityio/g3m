part of g3m.ex;

mixin GrpcDataTypeMixin {
  // ---------------------------------------------------------------------------
  // gRPC types
  // ---------------------------------------------------------------------------

  // Scalar types. We follow proto3 for easier gRPC code generation.
  // See: https://developers.google.com/protocol-buffers/docs/proto3#scalar

  DataType double;

  DataType float;

  /// Uses variable-length encoding. Inefficient for encoding negative numbers
  /// – if your field is likely to have negative values, use sint32 instead
  DataType int32;

  /// Uses variable-length encoding. Inefficient for encoding negative numbers
  /// - if your field is likely to have negative values, use sint64 instead.
  DataType int64;

  /// Uses variable-length encoding.
  DataType uint32;

  /// Uses variable-length encoding.
  DataType uint64;

  /// Uses variable-length encoding. Signed int value. These more efficiently
  /// encode negative numbers than regular int32s.
  DataType sint32;

  /// Uses variable-length encoding. Signed int value. These more
  /// efficiently encode negative numbers than regular int64s.
  DataType sint64;

  /// Always four bytes. More efficient than uint32 if values are often
  /// greater than 228.
  DataType fixed32;

  /// Always eight bytes. More efficient than uint64 if values are often
  /// greater than 256.
  DataType fixed64;

  /// Always four bytes.
  DataType sfixed32;

  /// Always eight bytes.
  DataType sfixed64;

  DataType bool;

  /// A string must always contain UTF-8 encoded or 7-bit ASCII text,
  /// and cannot be longer than 232.
  DataType string;

  /// May contain any arbitrary sequence of bytes no longer than 232.
  DataType bytes;

  void buildDataTypeScope(DataTypeScope type) {
    double = type('double');
    float = type('float');
    int32 = type('int32');
    int64 = type('int64');
    uint32 = type('uint32');
    uint64 = type('uint64');
    sint32 = type('sint32');
    sint64 = type('sint64');
    fixed32 = type('fixed32');
    fixed64 = type('fixed64');
    sfixed32 = type('sfixed32');
    sfixed64 = type('sfixed64');
    bool = type('bool');
    string = type('string');
    bytes = type('bytes');
  }
}

mixin CommonDataTypeMixin {
  DataType timestamp;

  DataType utcDate;
  DataType localDate;

  DataType utcDateTime;
  DataType localDateTime;

  void buildCommonDataType(DataTypeScope type) {
    timestamp = type('timestamp');

    utcDate = type('utc date');
    localDate = type('local date');

    utcDateTime = type('utc date time');
    localDateTime = type('local date time');
  }
}

class DataTypeScopeEx extends DataTypeScope
    with GrpcDataTypeMixin, CommonDataTypeMixin {
  final ConstraintScopeEx constraintScopeEx;

  DataTypeScopeEx(this.constraintScopeEx) : super(constraintScopeEx) {
    buildDataTypeScope(this);
    buildCommonDataType(this);
  }
}
