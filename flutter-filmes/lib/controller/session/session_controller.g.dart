// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SessionController on _SessionControllerBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SessionControllerBase.loading'))
      .value;

  final _$_loadingAtom = Atom(name: '_SessionControllerBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$authAsyncAction = AsyncAction('_SessionControllerBase.auth');

  @override
  Future auth() {
    return _$authAsyncAction.run(() => super.auth());
  }

  final _$_SessionControllerBaseActionController =
      ActionController(name: '_SessionControllerBase');

  @override
  dynamic logout() {
    final _$actionInfo = _$_SessionControllerBaseActionController.startAction(
        name: '_SessionControllerBase.logout');
    try {
      return super.logout();
    } finally {
      _$_SessionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
