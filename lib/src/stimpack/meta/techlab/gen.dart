part of g3.stimpack.meta.techlab;

class StimGenMeta implements Node {
  final StimModelPackage pack;

  final Map<StimModelType, Set<String>> values;

  StimpackCodeConfig _config;

  /// The external packs referred by this pack.
  /// This can be determined by figure out the types user by the other
  /// package.
  Set<StimModelPackage> _externalPacks;
  Map<StimModelType, Set<String>> _internalValues;
  Map<StimModelType, Set<String>> _externalValues;

  StimGenMeta(this.pack, this.values);

  @override
  Node build(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    _computeExternalPacks();
    _splitToInternalAndExternalValues();

    return Container([
      Directory.relative(
        'generated',
        Container([
          StimGenMetaPack(pack, _externalPacks, _externalValues.keys),
          StimGenMetaLib(pack, _externalPacks),
          StimGenMetaExt(pack, _externalValues),
          Directory.relative(
            'types',
            _buildTypeFiles(),
          ),
        ]),
      ),
      StimGenMetaInit(pack),
    ]);
  }

  Node _buildTypeFiles() {
    final files = pack.types.map((type) {
      final typeValues = values == null ? null : values[type];
      return StimGenMetaType(pack, type, typeValues);
    });

    return Container(files);
  }

  void _computeExternalPacks() {
    final p = stimpack.model.package;
    final systemPackages = {p.dart, p.model};

    /// Makes every pack depends on the model pack.
    _externalPacks = <StimModelPackage>{p.model};

    // Finds all external packs that this pack depends on.
    final processed = <StimModelType>{};
    final queue = Queue.of(pack.types);

    while (queue.isNotEmpty) {
      final t = queue.removeFirst();
      if (processed.contains(t)) continue;
      processed.add(t);

      var tPackage = t.package;
      if (tPackage != pack && !systemPackages.contains(tPackage)) {
        _externalPacks.add(tPackage);
      }

      if (t.collection != null) queue.add(t.collection);
      if (t.item != null) queue.add(t.item);

      if (t.fields != null) {
        for (final field in t.fields) {
          queue.add(field.type);
        }
      }
    }
  }

  void _splitToInternalAndExternalValues() {
    _internalValues = {};
    _externalValues = {};

    // Adds external values for type extension.
    // This is the special cases where all new types
    // defined in this package shall be injected
    // to the stimpack.model.type
    final typeNames = pack.types.map((type) {
      return _config.fieldNameOfType(type).toString();
    }).toSet();
    _externalValues[stimpack.model.type.model.type] = typeNames;

    if (values?.isNotEmpty != true) return;

    for (final e in values.entries) {
      final type = e.key;
      if (_externalPacks.contains(type.package)) {
        _externalValues[type] = e.value;
      } else {
        _internalValues[type] = e.value;
      }
    }
  }
}

void stimpackGen(
  StimModelPackage meta,
  String dir, {
  Map<StimModelType, Set<String>> values,
}) {
  stimpack.meta.validate(meta);

  Node program = SingleChildNode(
    Directory.relative(
      dir,
      Directory.relative(
        meta.name.snake().toString(),
        StimpackCodeConfig(
          StimGenMeta(meta, values),
        ),
      ),
    ),
  );

  Program.execute(program);
}
