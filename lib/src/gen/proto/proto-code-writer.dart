part of g3gen;

class ProtoCodeWriter extends Writer {
  ProtoCodeWriter._(StringSink io) : super(io);

  void writeSyntax(String version) {
    writeln('syntax = proto${version}');
    writeln();
  }

  void writePackage(String name) {
    writeln('package ${name};');
    writeln();
  }

  void writeImport(String file) {
    writeln('import ${file};');
    writeln();
  }

  void writeMessage(ProtoMessage message) {
    for (final i in message.eval()) {

    }
  }

  void writeMessageField(ProtoMessage message, ProtoMessageField field) {}

  void writeService(ProtoRpc service) {}

  void writeServiceMethod(ProtoRpc service, ProtoRpcMethod method) {}

  void writeServiceMethodRequestParam() {}

  void writeServiceMethodResponseParam() {}
}
