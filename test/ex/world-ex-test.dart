import 'package:g3m/g3mex.dart';
import 'package:test/test.dart';

void main() {
  test('core', () {
    var world = WorldEx();
    assert(world.pattern != null);
    assert(world.constraint != null);
    assert(world.type != null);
    assert(world.field != null);
    assert(world.model != null);
  });

  test('er', () {
    var world = WorldEx();
    assert(world.erRelationCardinal != null);
    assert(world.erRelationType != null);
    assert(world.erRelation != null);
  });

  test('db', () {
    var world = WorldEx();
    assert(world.dbEngine != null);
    assert(world.dbSchema != null);
    assert(world.dbTable != null);
  });

  test('story', () {
    var world = WorldEx();
    assert(world.storyActor != null);
    assert(world.storyAction != null);
    assert(world.story != null);
  });

  test('proto', () {
    var world = WorldEx();
    assert(world.protoMessageField != null);
    assert(world.protoMessage != null);
    assert(world.protoRpcMethod != null);
    assert(world.protoRpc != null);
    assert(world.protoLib != null);
  });
}
