import 'lib.dart';

void main() {
  final w = ToolWorld();

  final a1 = w.author(firstName: 'trung', lastName: 'ngo', middleName: 'abc');
  final a2 = w.author(firstName: 'trung ngo', lastName: 'ngo2');

  w.author.call(firstName: 'someone on earth', lastName: 'hello');
  a1.firstName = 'hello world';
  final all = a1 + a2;
  var p = w.package;
  final p1 = p(author: a1);
  final p2 = p(author: a2);
  final pall = p1 + p2;
  print(all.eval().map((e) => e.firstName));
  for (final i in pall.eval()) {
    print(i.author.firstName);
  }
}
