import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_rbac.dart';

void main() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'story');

  final tStory = t.symbolOf(name: 'story', package: meta);

  final tAction = t.symbolOf(
      name: 'action',
      package: meta,
      values: _crudActions +
          _authActions +
          _reversibleActions +
          _flowActions +
          _miscActions);

  final tActor = t.symbolOf(name: 'actor', package: meta);

  tStory.fields = {
    f.of(name: 'actor', type: tActor).required(),
    f.of(name: 'action', type: tAction).required(),
  };

  tActor.fields = {
    f.setOf(name: 'roles', type: t.rbac.role),
  };

  tAction.fields = {
    // An action can be a combination of other actions.
    f.setOf(name: 'actions', type: tAction),
  };

  stimpack.meta.validate(meta);
  stimpackGen(meta, 'lib/src/stimpack/${meta.name.snake()}');
}

const _crudActions = {
  'create',
  'update',
  'get',
  'find',
  'delete',
  'undelete',
  'manage',
};

const _authActions = {
  'sign up',
  'sign in',
  'sign out',
};

const _reversibleActions = {
  'star',
  'unstar',
  'like',
  'unlike',
  'send',
  'receive',
  'submit',
  'cancel',
  'share',
  'unshare',
  'start',
  'stop',
  'play',
  'pause',
  'resume',
  'enter',
  'leave',
  'upload',
  'download',
};

const _flowActions = {
  'invite',
  'suggest',
  'accept',
  'deny',
};

const _miscActions = {
  'request',
  'reset',
  'see',
};
