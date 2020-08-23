class ApiWorld {
  Map<String, ApiLib> libMap;
}

class ApiLib {
  String name;
  Map<String, ApiMessage> messageMap;
  Map<String, ApiRpc> rpcMap;
}

class ApiMessage {
  String name;
  Map<String, ApiMessageField> fieldMap;
}

class ApiMessageField {
  String name;
  String type;
}

class ApiRpc {
  String name;
  Map<String, ApiMethod> methodMap;
}

class ApiMethod {
  String name;
  ApiMessage request;
  bool requestStreamed;
  ApiMessage response;
  bool responseStreamed;
}
