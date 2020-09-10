import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  genCommonPack();
}

void genCommonPack() {
  final model = stimpack.model;
  final t = model.type;
  final meta = model.package.of(name: 'common');

  stimpackGen(meta, 'lib/src/stimpack', values: {
    t.model.type: {
      ..._paginationTypes,
    },
    t.model.field: {
      ..._paginationFields,
    },
  });
}

const _paginationTypes = {
  'pager',
};

const _paginationFields = {
  'total',
  'count'
  'size',
  'index',
  'page',
  'offset',
  'limit',
};
