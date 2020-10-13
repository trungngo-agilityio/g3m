import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import 'utils.dart';

class _ContextAncestorDump implements Node {
  @override
  Node build(BuildContext context) {
    final names =
        context.ancestors.map((e) => e.runtimeType.toString()).join(', ');
    return Text(names);
  }
}

void main() {
  group('ancestors', () {
    test('comment', () {
      var code = (_ContextAncestorDump());
      runAndExpect(code, 'OutputRedirect, Directory');
    });
  });
}
