part of g3.util;

/// Provides functions to read objects from an object storage.
abstract class StoreReader {
  bool readBoolean(String key);

  num readInt(String key);

  String readString(String key);

  T read<T>(String key);

  Iterable<String> keys();

  StoreReader child(String path);
}

abstract class StoreWriter {
  /// Clears the store.
  void clear();

  void remove(String key);

  void writeBoolean(String key, bool value);

  void writeInt(String key, num value);

  void writeString(String key, String value);

  /// Writes a simple [value] into the store, identified by [key].
  void write<T>(String key, T value);

  StoreWriter child(String path);
}

abstract class Store implements StoreReader, StoreWriter {
  @override
  Store child(String path);

  @override
  bool readBoolean(String key) => read<bool>(key);

  @override
  num readInt(String key) => read<num>(key);

  @override
  String readString(String key) => read<String>(key);

  @override
  void writeBoolean(String key, bool value) => write<bool>(key, value);

  @override
  void writeInt(String key, num value) => write<num>(key, value);

  @override
  void writeString(String key, String value) => write<String>(key, value);
}

class MemoryStore extends Store {
  final String name;

  static final storeMap = {};

  static MemoryStore _root;

  MemoryStore._(this.name);

  factory MemoryStore.root() {
    return _root ??= build('r');
  }

  static MemoryStore build(String name) {
    if (storeMap.containsKey(name)) {
      return storeMap[name];
    } else {
      final store = MemoryStore._(name);
      storeMap[name] = store;
      return store;
    }
  }

  Map<String, dynamic> _db;

  @override
  List<String> keys() {
    return _db.keys.toList();
  }

  @override
  void clear() {
    _db.clear();
  }

  @override
  T read<T>(String key) {
    return _db.keys.contains(key) ? _db[key] as T : null;
  }

  @override
  void remove(String key) {
    if (_db.containsKey(key)) {
      _db.remove(key);
    }
  }

  @override
  void write<T>(String key, T value) {
    _db[key] = value;
  }

  @override
  MemoryStore child(String path) {
    return build('${name}_${path}');
  }
}
