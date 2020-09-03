part of g3.stimpack.core;

// region Name

enum _NameOp {
  // binary
  add,
  addRight,
  addLeft,
  remove,
  removeIfStartsWith,
  removeIfEndsWith,
  reset,

  // unary
  ref,
  upper,
  lower,
  camel,
  pascal,
  snake,
  dot,
  path,
  param,
  header,
  title,
  constant,
  sentence
}

/// This class provides dynamic string definition and processing.
///
class StimName {
  final String _text;

  final _NameOp _op;
  final Object _left;

  final Object _right;

  StimName._(this._op, this._left, this._right, this._text);

  factory StimName.of(dynamic value) {
    if (value is StimName) {
      return value;
    } else {
      return StimName._(null, null, null, _normalized(value));
    }
  }

  StimName operator ^(Object another) {
    return reset(another);
  }

  StimName reset(Object another) {
    return StimName._(_NameOp.reset, this, another, null);
  }

  StimName operator &(Object another) {
    return addRight(another);
  }

  StimName operator +(Object another) {
    return addRight(another);
  }

  StimName operator <<(Object another) {
    return addLeft(another);
  }

  StimName addRight(Object another) {
    return StimName._(_NameOp.addRight, this, another, null);
  }

  StimName operator >>(Object another) {
    return addRight(another);
  }

  StimName addLeft(Object another) {
    return StimName._(_NameOp.addLeft, this, another, null);
  }

  StimName operator -(Object another) {
    return remove(another);
  }

  StimName remove(Object another) {
    return StimName._(_NameOp.remove, this, another, null);
  }

  StimName removeIfStartsWith(Object another) {
    return StimName._(_NameOp.removeIfStartsWith, this, another, null);
  }

  StimName removeIfEndsWith(Object another) {
    return StimName._(_NameOp.removeIfEndsWith, this, another, null);
  }

  StimName ref() {
    return StimName._(_NameOp.ref, this, null, null);
  }

  StimName upper() {
    return StimName._(_NameOp.upper, this, null, null);
  }

  StimName lower() {
    return StimName._(_NameOp.lower, this, null, null);
  }

  StimName camel() {
    return StimName._(_NameOp.camel, this, null, null);
  }

  StimName pascal() {
    return StimName._(_NameOp.pascal, this, null, null);
  }

  StimName snake() {
    return StimName._(_NameOp.snake, this, null, null);
  }

  StimName dot() {
    return StimName._(_NameOp.dot, this, null, null);
  }

  StimName path() {
    return StimName._(_NameOp.path, this, null, null);
  }

  StimName param() {
    return StimName._(_NameOp.param, this, null, null);
  }

  StimName header() {
    return StimName._(_NameOp.header, this, null, null);
  }

  StimName title() {
    return StimName._(_NameOp.title, this, null, null);
  }

  StimName constant() {
    return StimName._(_NameOp.constant, this, null, null);
  }

  StimName sentence() {
    return StimName._(_NameOp.sentence, this, null, null);
  }

  /// Normalizes an input object to a name string that.
  /// - trim left
  /// - trim right
  /// - no double space in the middle.
  ///
  static String _normalized(Object s) {
    if (s == null) return s;
    if (s is StimName) return s.toString();
    return s.toString().trim().replaceAll('  ', ' ');
  }

  /// Concat two operands to get the final string.
  ///
  static String _add(String l, String r) {
    if (l == '') {
      return r;
    } else if (r == '') {
      return l;
    } else {
      return '$l $r';
    }
  }

  static String _remove(String l, String r) {
    if (l == '') {
      return '';
    } else if (r == '') {
      return l;
    } else {
      return _normalized(l.replaceAll(r, ''));
    }
  }

  static String _removeIfStartsWith(String l, String r) {
    if (l == '') {
      return '';
    } else if (r == '') {
      return l;
    } else {
      if (l.startsWith(r)) {
        l = l.substring(r.length);
      }
      return _normalized(l);
    }
  }

  static String _removeIfEndsWith(String l, String r) {
    if (l == '') {
      return '';
    } else if (r == '') {
      return l;
    } else {
      if (l.endsWith(r)) {
        l = l.substring(0, l.length - r.length);
      }
      return _normalized(l);
    }
  }

  @override
  String toString() {
    var l = _normalized(_left);
    var r = _normalized(_right);

    switch (_op) {
      case _NameOp.add:
        return _add(l, r);

      case _NameOp.addRight:
        return _add(l, r);

      case _NameOp.addLeft:
        return _add(r, l);

      case _NameOp.remove:
        return _remove(l, r);

      case _NameOp.removeIfStartsWith:
        return _removeIfStartsWith(l, r);

      case _NameOp.removeIfEndsWith:
        return _removeIfEndsWith(l, r);

      case _NameOp.reset:
        // This is the special operation. Ignore the current one and
        // replace by the new one.
        return r;

      case _NameOp.upper:
        return l.toUpperCase();

      case _NameOp.lower:
        return l.toLowerCase();

      case _NameOp.camel:
        return ReCase.forCode(l).camelCase;

      case _NameOp.pascal:
        return ReCase.forCode(l).pascalCase;

      case _NameOp.snake:
        return ReCase.forCode(l).snakeCase;

      case _NameOp.dot:
        return ReCase.forCode(l).dotCase;

      case _NameOp.path:
        return ReCase.forCode(l).pathCase;

      case _NameOp.param:
        return ReCase.forCode(l).paramCase;

      case _NameOp.header:
        return ReCase.forCode(l).headerCase;

      case _NameOp.title:
        return ReCase.forCode(l).titleCase;

      case _NameOp.constant:
        return ReCase.forCode(l).constantCase;

      case _NameOp.sentence:
        return ReCase.forCode(l).sentenceCase;

      default:
        if (_text != null) {
          return _text;
        } else {
          return l;
        }
    }
  }

  bool get isEmpty {
    return toString().isEmpty;
  }

  bool get isNotEmpty {
    return toString().isNotEmpty;
  }

  @override
  bool operator ==(other) {
    return isEquals(other);
  }

  bool isEquals(other) {
    return _text == other?.toString();
  }
}

/// Provides syntactic sugar for a string
/// and a name operation.
///
extension StringNameExtension on String {
  StimName operator &(StimName another) {
    return StimName.of(this) & another;
  }

  StimName operator >>(StimName another) {
    return StimName.of(this) >> another;
  }

  StimName operator <<(StimName another) {
    return StimName.of(this) << another;
  }

  StimName operator +(StimName another) {
    return StimName.of(this) + another;
  }
}

// endregion
