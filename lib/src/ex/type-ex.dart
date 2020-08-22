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

  DataType primitiveTypes;

  void buildDataTypeScope(DataTypeScope type) {
    primitiveTypes = type.none;
    primitiveTypes += double = type('double');
    primitiveTypes += float = type('float');
    primitiveTypes += int32 = type('int32');
    primitiveTypes += int64 = type('int64');
    primitiveTypes += uint32 = type('uint32');
    primitiveTypes += uint64 = type('uint64');
    primitiveTypes += sint32 = type('sint32');
    primitiveTypes += sint64 = type('sint64');
    primitiveTypes += fixed32 = type('fixed32');
    primitiveTypes += fixed64 = type('fixed64');
    primitiveTypes += sfixed32 = type('sfixed32');
    primitiveTypes += sfixed64 = type('sfixed64');
    primitiveTypes += bool = type('bool');
    primitiveTypes += string = type('string');
    primitiveTypes += bytes = type('bytes');
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
