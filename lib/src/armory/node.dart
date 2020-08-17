part of g3.armory;

typedef _NodeParseErrorFunc<T> = void Function();
typedef _NodeParseFunc<T> = T Function(dynamic v);

T _parseNode<T>(dynamic value, _NodeParseFunc<T> next,
    {_NodeParseErrorFunc<T> error}) {
  if (value == null) return null;
  if (value is T) return value;

  final res = next(value);
  if (res != null) return res;
  if (error != null) error();
  return null;
}

List<T> _parseNodeList<T>(dynamic value, _NodeParseFunc next,
    {_NodeParseErrorFunc error}) {
  if (value == null) return null;

  List<T> res;

  if (value is T) {
    // return as a single item list
    res = [value];
  } else if (value is List<T>) {
    // return as-is
    res = value;
  } else if (value is List) {
    // Try to map the list as custom function.
    var hasError = false;
    final tryParsed = value
        .map((e) => _parseNode<T>(e, next, error: () => hasError = true))
        .toList();

    if (!hasError) res = tryParsed;
  } else if (value is Map) {
    var hasError = false;
    // Try to map via custom function.
    var tryParsed = value.entries
        .map((e) => _parseNode<T>(e, next, error: () => hasError = true))
        .toList();

    if (!hasError) res = tryParsed;
  } else {
    var tryParsed = next(value);
    if (tryParsed != null) {
      res = [tryParsed];
    }
    // Cannot parse this type, just raise the error.
  }

  // Removes out all null value.
  res = res?.where((e) => e != null)?.toList();

  if (res?.isNotEmpty != true) res = null;

  if (res == null && error != null) error();

  return res;
}
