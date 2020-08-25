import 'package:g3m/src/stimpack/packs/gen/lib.dart';

class MetaPacks {
  MetaPack all, proto, core, dart;
}

class MetaDartPack {
  MetaTerm all, string, int;
}

class MetaCorePack {
  MetaTerm all, model, field, constraint, type;
}

class MetaProtoPack {
  MetaTerm all, lib, message, field, service, method;
}

class MetaRelationTypes {
  MetaRelationType all, oneToOne, oneToMany, has, hasMany;
}

class MetaRelations {
  MetaRelation all;
}

class MetaNames {
  MetaPacks packs;
  MetaDartPack dartPack;
  MetaCorePack corePack;
  MetaProtoPack protoPack;

  MetaRelations relations;
  MetaRelationTypes relationTypes;
}

class MetaStimpack {
  final w = MetaWorld();
  final n = MetaNames();

  void run() {
    _buildPacks();
    _buildDartTerms();
    _buildCoreTerms();
    _buildProtoTerms();
    _buildRelationTypes();
    _buildRelations();
  }

  void _buildPacks() {
    var p = w.metaPack;
    n.packs = MetaPacks()
      ..all = p.call('all')
      ..all += n.packs.dart = p.call('dart')
      ..all += n.packs.core = p.call('core')
      ..all += n.packs.proto = p.call('proto');
  }

  void _buildProtoTerms() {
    final t = w.metaTerm;
    final x = n.protoPack = MetaProtoPack()
      ..lib = t.call('lib')
      ..message = t.call('message')
      ..field = t.call('field')
      ..service = t.call('service')
      ..method = t.call('method');

    x.all = x.lib + x.message + x.field + x.service + x.method;
    x.all.pack = n.packs.proto;
  }

  void _buildDartTerms() {
    // Builds core protoTerms
    var t = w.metaTerm;
    final x = n.dartPack = MetaDartPack()
      ..string = t.call('string')
      ..int = t.call('int');

    x.all = x.int + x.string;

    // Sets the pack for all field
    x.all.pack = n.packs.dart;
  }

  void _buildCoreTerms() {
    // Builds core protoTerms
    final t = w.metaTerm;
    final x = n.corePack = MetaCorePack()
      ..model = t.call('model')
      ..field = t.call('field')
      ..type = t.call('type')
      ..constraint = t.call('constraint');

    x.all = x.model + x.field + x.type + x.constraint;

    // Sets the pack for all field
    x.all.pack = n.packs.core;
  }

  void _buildRelationTypes() {
    var t = w.metaRelationType;
    final x = n.relationTypes = MetaRelationTypes()
      ..oneToOne = t.call('one to one')
      ..oneToMany = t.call('one to many')
      ..has = t.call('has')
      ..hasMany = t.call('has many');

    x.all = x.oneToOne + x.oneToMany + x.has + x.hasMany;
  }

  void _buildRelations() {
    n.relations = MetaRelations();

    _buildCoreRelations();
    _buildProtoRelations();
  }

  void _buildCoreRelations() {
    final m = n.corePack;
    _has(m.model, [m.field]);
    _has(m.field, [m.type]);
    _hasMany(m.type, [m.constraint]);
  }

  void _buildProtoRelations() {
    final m = n.protoPack;
    _oneToMany(m.lib, [m.message, m.service]);
    _oneToMany(m.message, [m.field]);
    _oneToMany(m.service, [m.method]);
    _has(m.field, [n.corePack.type]);
  }

  void _oneToOne(MetaTerm from, List<MetaTerm> to) {
    for (final i in to) {
      _addRelation(from, i, n.relationTypes.oneToOne);
    }
  }

  void _oneToMany(MetaTerm from, List<MetaTerm> to) {
    for (final i in to) {
      _addRelation(from, i, n.relationTypes.oneToMany);
    }
  }

  void _has(MetaTerm from, List<MetaTerm> to) {
    for (final i in to) {
      _addRelation(from, i, n.relationTypes.has);
    }
  }

  void _hasMany(MetaTerm from, List<MetaTerm> to) {
    for (final i in to) {
      _addRelation(from, i, n.relationTypes.hasMany);
    }
  }

  void _addRelation(MetaTerm from, MetaTerm to, MetaRelationType type) {
    n.relations.all += w.metaRelation.call(null)
      ..from = n.corePack.model
      ..to = n.corePack.field
      ..type = n.relationTypes.hasMany;
  }
}

void main() {
  final meta = MetaStimpack();
  meta.run();
}
