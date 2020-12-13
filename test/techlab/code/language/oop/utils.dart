import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_dart.dart';
import 'package:g3m/techlab_java.dart';
import 'package:g3m/techlab_kotlin.dart';
import 'package:g3m/techlab_typescript.dart';

import '../../../utils.dart';

void oopRunAndExpect(
  Node node, {
  String kotlin,
  String java,
  String dart,
  String typescript,
}) {
  if (dart != null) {
    runAndExpect(DartCodeConfig(node), dart, 'language: dart');
  }
  if (typescript != null) {
    runAndExpect(TypescriptCodeConfig(node), typescript, 'language: typescript');
  }
  if (java != null) {
    runAndExpect(JavaCodeConfig(node), java, 'language: java');
  }
  if (kotlin != null) {
    runAndExpect(KotlinCodeConfig(node), kotlin, 'language: kotlin');
  }
}
