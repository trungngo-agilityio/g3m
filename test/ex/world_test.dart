import 'package:g3m/g3mex.dart';
import 'package:test/test.dart';

void main() {
  test('name', () {
    var w = World();
    w.story.all.eval().forEach((s) {
      print(s);
      print('  request: ${Set.of(s.request.eval())}');
      print('  response: ${Set.of(s.response.eval())}');
    });

    for (var i in w.table.all.eval()) {
      print(i.name);
      print('  models: ${i.models}');
      var fields = i.fields + i.models.fields;
      print('  fields: ${fields.eval()}');
    }
  });
}
