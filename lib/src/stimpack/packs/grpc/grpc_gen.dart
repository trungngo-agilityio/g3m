import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_grpc.dart';
import 'package:g3m/stimpack_meta.dart';

void main() {
  stimpackGen(stimpack.grpc.meta, 'lib/src/stimpack/packs/grpc/generated');
}
