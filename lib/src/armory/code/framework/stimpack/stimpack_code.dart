part of g3.armory.stimpack;

/// Defines global configuration for java code generation.
///
class StimpackCodeConfig extends ExactlyOneNode<StimpackCodeConfig> {
  ModelScope modelScope;
  FieldScopeEx fieldScope;
  DataTypeScopeEx typeScope;
  DataType privateTypes;

  StimpackCodeConfig(Node child) : super(child) {
    final w = WorldEx();
    modelScope = w.model;
    fieldScope = w.field;
    typeScope = w.type;
    privateTypes = typeScope.primitiveTypes;
  }

  bool isPrimitiveType(DataType type) {
    return privateTypes.contains(type);
  }

  @override
  Node buildOne(BuildContext context, Node child) {
    return DartCodeConfig(
      // Adds grpc types support
      CodeTypeNameMapperConfig.forGRpcTypeToDartLike(
        child,
      ),
    );
  }
}
