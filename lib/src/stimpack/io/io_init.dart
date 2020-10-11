part of g3.stimpack.io.init;

/// This function is called during the initialization of io
void _stimInitIoPack() {
  _initFileTypes();
}

void _initFileTypes() {
  final ft = stimpack.io.fileType;
  ft.txt = ft.of(name: 'txt');
}
