class ProtoWorld {
  Map<String, ProtoLib> libMap;
}

class ProtoLib {
  String name;
  Map<String, ProtoMessage> messageMap;
  Map<String, ProtoRpc> rpcMap;
}

class ProtoMessage {
  String name;
  Map<String, ProtoMessageField> fieldMap;
}

class ProtoMessageField {
  String name;
  String type;
  int pos;
}

class ProtoRpc {
  String name;
  Map<String, ProtoMethod> methodMap;
}

class ProtoMethod {
  String name;
  ProtoMessage request;
  bool requestStreamed;
  ProtoMessage response;
  bool responseStreamed;
}
