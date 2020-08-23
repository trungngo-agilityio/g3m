part of g3.stimpack.core;

// region Name

enum _NameOp {
  // binary
  add,
  addRight,
  addLeft,
  remove,
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
class Name {
  String text;

  final _NameOp _op;
  final Object _left;

  final Object _right;

  Name(String value)
      : text = _normalized(value),
        _op = null,
        _left = null,
        _right = null;

  Name._(this._op, this._left, this._right) : text = null;

  Name operator ^(Object another) {
    return reset(another);
  }

  Name reset(Object another) {
    return Name._(_NameOp.reset, this, another);
  }

  Name operator &(Object another) {
    return addRight(another);
  }

  Name operator +(Object another) {
    return addRight(another);
  }

  Name operator <<(Object another) {
    return addLeft(another);
  }

  Name addRight(Object another) {
    return Name._(_NameOp.addRight, this, another);
  }

  Name operator >>(Object another) {
    return addRight(another);
  }

  Name addLeft(Object another) {
    return Name._(_NameOp.addLeft, this, another);
  }

  Name operator -(Object another) {
    return remove(another);
  }

  Name remove(Object another) {
    return Name._(_NameOp.remove, this, another);
  }

  Name ref() {
    return Name._(_NameOp.ref, this, null);
  }

  Name upper() {
    return Name._(_NameOp.upper, this, null);
  }

  Name lower() {
    return Name._(_NameOp.lower, this, null);
  }

  Name camel() {
    return Name._(_NameOp.camel, this, null);
  }

  Name pascal() {
    return Name._(_NameOp.pascal, this, null);
  }

  Name snake() {
    return Name._(_NameOp.snake, this, null);
  }

  Name dot() {
    return Name._(_NameOp.dot, this, null);
  }

  Name path() {
    return Name._(_NameOp.path, this, null);
  }

  Name param() {
    return Name._(_NameOp.param, this, null);
  }

  Name header() {
    return Name._(_NameOp.header, this, null);
  }

  Name title() {
    return Name._(_NameOp.title, this, null);
  }

  Name constant() {
    return Name._(_NameOp.constant, this, null);
  }

  Name sentence() {
    return Name._(_NameOp.sentence, this, null);
  }

  /// Normalizes an input object to a name string that.
  /// - trim left
  /// - trim right
  /// - no double space in the middle.
  ///
  static String _normalized(Object s) {
    if (s == null) return s;
    if (s is Name) return s.toString();
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
        if (text != null) {
          return text;
        } else {
          return l;
        }
    }
  }

  @override
  bool operator ==(other) {
    return text == other.toString();
  }
}

/// Provides syntactic sugar for a string
/// and a name operation.
///
extension StringNameExtension on String {
  Name operator &(Name another) {
    return Name(this) & another;
  }

  Name operator >>(Name another) {
    return Name(this) >> another;
  }

  Name operator <<(Name another) {
    return Name(this) << another;
  }

  Name operator +(Name another) {
    return Name(this) + another;
  }
}

// endregion
