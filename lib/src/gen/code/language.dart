class CodeLanguage {
  final String name;
  final String fileExt;

  CodeLanguage(this.name, {this.fileExt});
}

class CodeLanguages {
  static final CodeLanguage kotlin = CodeLanguage('kotlin', fileExt: 'kt');
  static final CodeLanguage java = CodeLanguage('java', fileExt: 'java');
  static final CodeLanguage cSharp = CodeLanguage('cSharp', fileExt: 'cs');
  static final CodeLanguage python = CodeLanguage('python', fileExt: 'py');
  static final CodeLanguage typeScript =
      CodeLanguage('typeScript', fileExt: 'ts');
  static final CodeLanguage proto3 = CodeLanguage('proto3', fileExt: 'proto3');
  static final CodeLanguage gRpc = CodeLanguage('gRpc');
  static final CodeLanguage go = CodeLanguage('go');
}
