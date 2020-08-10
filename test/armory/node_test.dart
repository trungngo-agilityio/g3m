import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

void main() {
  test('name', () {
    Program.execute(
      Project(
        content: Directory(
          '/tmp',
          Container([
            Repository(
              sourceControl: SourceControl.git,
              name: 'hello-world',
              content: Container([
                DotKeepFile(),
              ]),
            ),
            DotKeepFile(),
            ReadmeFile(
              Container([
                UpperCase(
                  Section(
                      'README',
                      Container([
                        Text('Readme content'),
                        Section(
                            'Hello',
                            Container(
                              [Text('A sub section')],
                            )),
                      ])),
                ),
                Text('hello world'),
                NewLine(),
                Text('Another hello world'),
                NewLine(),
              ]),
            ),
          ]),
        ),
      ),
    );
  });
}