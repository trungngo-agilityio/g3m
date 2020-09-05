import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  genNgxsPack();
}

void genNgxsPack() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'ngxs');

  StimModelType type(String name) => t.symbolOf(name: name, package: meta);
  StimModelField field(String name, StimModelType type) =>
      f.of(name: name, type: type);
  StimModelField fieldSet(String name, StimModelType type) =>
      f.setOf(name: name, type: type);

  final tFeature = type('feature');
  final tAction = type('action');
  final tState = type('state');
  final tSelect = type('select');

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  final fField = field('field', t.model.field);
  final fFields = fieldSet('fields', t.model.field);

  final fModel = field('model', t.model.type);

  final fFeature = field('feature', tFeature);
  final fFeatureSet = fieldSet('features', tFeature);

  final fAction = field('action', tAction);
  final fActionSet = fieldSet('actions', tAction);

  final fState = field('state', tState);
  final fStateSet = fieldSet('states', tState);

  final fSelect = field('select', tSelect);
  final fSelectSet = fieldSet('selects', tSelect);

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------
  tFeature.fields = {fStateSet};
  tState.fields = {fModel, fActionSet, fSelectSet};
  tAction.fields = {fFields};
  tSelect.fields = {fField};

  stimpackGen(meta, 'lib/src/stimpack', values: {});
}
