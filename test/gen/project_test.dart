import 'dart:io';

import 'package:g3m/g3gen.dart';
import 'package:test/test.dart';

class FakeItem implements WritableProjectItem {
  int writeCalled = 0;

  @override
  void write(StringSink out) {
    writeCalled++;
    out.writeln('Hello World');
  }
}

class MyProgram implements Program {
  int loadCalled = 0;
  int buildCalled = 0;
  int writeCalled = 0;
  int deployedCalled = 0;
  FakeItem item = FakeItem();

  @override
  void load() {
    print('load');
    loadCalled++;
  }

  @override
  void build(ProjectFolder folder) {
    folder.newFile('fake-item.txt', item);
    buildCalled++;
  }

  @override
  void write(ProjectFolder folder) {
    writeCalled++;
  }

  @override
  void deploy(ProjectFolder folder) {
    deployedCalled++;
  }
}

void main() {
  test('project - step by step', () {
    var program = MyProgram();
    var out = '/tmp/g3gen-test';
    var outDir = Directory(out);
    if (outDir.existsSync()) {
      outDir.deleteSync(recursive: true);
    }

    var p = Project.open(program, out);
    p.load();
    expect(program.loadCalled, equals(1));

    p.build();
    expect(program.buildCalled, equals(1));

    p.write();
    expect(program.item.writeCalled, equals(1));

    p.deploy();
    expect(program.deployedCalled, equals(1));

    expect(program.writeCalled, equals(1));
    expect(program.item.writeCalled, equals(1));
    expect(program.buildCalled, equals(1));
    expect(program.loadCalled, equals(1));

    // Now the output dir must exists
    expect(outDir.existsSync(), isTrue);
  });

  test('project - all', () {
    var program = MyProgram();
    var out = '/tmp/g3gen-test';
    var p = Project.open(program, out);

    p.deploy();
    expect(program.deployedCalled, equals(1));

    expect(program.writeCalled, equals(1));
    expect(program.item.writeCalled, equals(1));
    expect(program.buildCalled, equals(1));
    expect(program.loadCalled, equals(1));
  });
}
