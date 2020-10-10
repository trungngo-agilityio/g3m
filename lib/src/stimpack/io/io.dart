library g3.stimpack.io.init;

import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as io_path;
import 'dart:io' as io;

import 'generated/def/io.dart';

part 'generated/io_ext.dart';

part 'io_init.dart';
part 'io_dir_ext.dart';

/// This function is called during the initialization of io
void _stimInitIoPack() {
  _initFileTypes();
}
