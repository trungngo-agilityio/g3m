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
  sentence,
  words,

  // inflection
  plural,
  singular,
  past,
}

abstract class StimNamed {
  StimName get name;
}

/// This class provides dynamic string definition and processing.
///
class StimName {
  final String _text;
  final _NameOp _op;
  final Object _left;
  final Object _right;
  StimName _root;

  String _s;
  StimName _upper,
      _lower,
      _camel,
      _pascal,
      _snake,
      _dot,
      _path,
      _param,
      _header,
      _title,
      _constant,
      _sentence,
      _words,
      _plural,
      _singular,
      _past;

  StimName._(this._op, this._left, this._right, this._text, this._root) {
      _root ??= this;
  }

  factory StimName.of(dynamic value) {
    if (value is StimName) {
      return value;
    } else if (value is StimNamed) {
      return StimName.refOf(value);
    } else {
      return StimName._(null, null, null, _normalized(value), null);
    }
  }

  factory StimName.refOf(StimNamed value) {
    assert(value != null);
    return StimName._(_NameOp.ref, value, null, null, value.name._root);
  }

  StimName operator ^(Object another) {
    return reset(another);
  }

  StimName reset(Object another) {
    return StimName._(_NameOp.reset, this, another, null, null);
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
    return StimName._(_NameOp.addRight, this, another, null, null);
  }

  StimName operator >>(Object another) {
    return addRight(another);
  }

  StimName addLeft(Object another) {
    return StimName._(_NameOp.addLeft, this, another, null, null);
  }

  StimName operator -(Object another) {
    return remove(another);
  }

  StimName remove(Object another) {
    return StimName._(_NameOp.remove, this, another, null, null);
  }

  StimName removeIfStartsWith(Object another) {
    return StimName._(_NameOp.removeIfStartsWith, this, another, null, null);
  }

  StimName removeIfEndsWith(Object another) {
    return StimName._(_NameOp.removeIfEndsWith, this, another, null, null);
  }

  StimName upper() {
    _root._upper ??= StimName._(_NameOp.upper, _root, null, null, _root);
    return _root._upper;
  }

  StimName lower() {
    _root._lower ??= StimName._(_NameOp.lower, _root, null, null, _root);
    return _root._lower;
  }

  StimName camel() {
    _root._camel ??= StimName._(_NameOp.camel, _root, null, null, _root);
    return _root._camel;
  }

  StimName pascal() {
    _root._pascal ??= StimName._(_NameOp.pascal, _root, null, null, _root);
    return _root._pascal;
  }

  StimName snake() {
    _root._snake ??= StimName._(_NameOp.snake, _root, null, null, _root);
    return _root._snake;
  }

  StimName dot() {
    _root._dot ??= StimName._(_NameOp.dot, _root, null, null, _root);
    return _root._dot;
  }

  StimName path() {
    _root._path ??= StimName._(_NameOp.path, _root, null, null, _root);
    return _root._path;
  }

  StimName param() {
    _root._param ??= StimName._(_NameOp.param, _root, null, null, _root);
    return _root._param;
  }

  StimName header() {
    _root._header ??= StimName._(_NameOp.header, _root, null, null, _root);
    return _root._header;
  }

  StimName title() {
    _root._title ??= StimName._(_NameOp.title, _root, null, null, _root);
    return _root._title;
  }

  StimName constant() {
    _root._constant ??= StimName._(_NameOp.constant, _root, null, null, _root);
    return _root._constant;
  }

  StimName sentence() {
    _root._sentence ??= StimName._(_NameOp.sentence, _root, null, null, _root);
    return _root._sentence;
  }

  StimName words() {
    _root._words ??= StimName._(_NameOp.words, _root, null, null, _root);
    return _root._words;
  }

  StimName plural() {
    _root._plural ??= StimName._(_NameOp.plural, this, null, null, null);
    return _root._plural;
  }

  StimName singular() {
    _root._singular ??= StimName._(_NameOp.singular, this, null, null, null);
    return _root._singular;
  }

  StimName past() {
    _root._past ??= StimName._(_NameOp.past, this, null, null, null);
    return _root._past;
  }

  /// Normalizes an input object to a name string that.
  /// - trim left
  /// - trim right
  /// - no double space in the middle.
  ///
  static String _normalized(Object s) {
    if (s == null) return '';
    if (s is StimName) return s.toString();
    if (s is StimNamed) {
      final lName = s as StimNamed;
      s = lName.name?.toString() ?? '';
    }
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
    // Computes and cache the result;
    _s ??= _toString();
    return _s;
  }

  /// The internal to string implementation.
  String _toString() {
    final l = _normalized(_left);
    final r = _normalized(_right);

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
        return ReCase.forCode(l).camel;

      case _NameOp.pascal:
        return ReCase.forCode(l).pascal;

      case _NameOp.snake:
        return ReCase.forCode(l).snake;

      case _NameOp.dot:
        return ReCase.forCode(l).dot;

      case _NameOp.path:
        return ReCase.forCode(l).path;

      case _NameOp.param:
        return ReCase.forCode(l).param;

      case _NameOp.header:
        return ReCase.forCode(l).header;

      case _NameOp.title:
        return ReCase.forCode(l).title;

      case _NameOp.constant:
        return ReCase.forCode(l).constant;

      case _NameOp.sentence:
        return ReCase.forCode(l).sentence;

      case _NameOp.words:
        return ReCase.forCode(l).words;

      case _NameOp.plural:
        return StringFuncs.plural(l);

      case _NameOp.singular:
        return StringFuncs.singular(l);

      case _NameOp.past:
        return StringFuncs.past(l);

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
    return toString() == other?.toString();
  }
}

/// Provides syntactic sugar for a string
/// and a name operation.
///
extension StringNameExtension on String {
  StimName operator &(dynamic another) {
    return StimName.of(this) & StimName.of(another);
  }

  StimName operator >>(dynamic another) {
    return StimName.of(this) >> StimName.of(another);
  }

  StimName operator <<(dynamic another) {
    return StimName.of(this) << StimName.of(another);
  }

  StimName operator +(dynamic another) {
    return StimName.of(this) + StimName.of(another);
  }
}

extension StimNamedExtension on StimNamed {
  StimName operator &(dynamic another) {
    return StimName.refOf(this) & StimName.of(another);
  }

  StimName operator >>(dynamic another) {
    return StimName.refOf(this) >> StimName.of(another);
  }

  StimName operator <<(dynamic another) {
    return StimName.refOf(this) << StimName.of(another);
  }

  StimName operator +(dynamic another) {
    return StimName.refOf(this) + StimName.of(another);
  }

  StimName operator ^(dynamic another) {
    return StimName.refOf(this) ^ StimName.of(another);
  }
}

// endregion
