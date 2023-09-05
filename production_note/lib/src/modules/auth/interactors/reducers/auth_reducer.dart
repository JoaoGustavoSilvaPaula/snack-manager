import 'package:asp/asp.dart';
import 'package:asuka/snackbars/asuka_snack_bar.dart';

import '../atoms/auth_atom.dart';
import '../services/auth_service.dart';
import '../states/auth_state.dart';

class AuthReducer extends Reducer {
  final AuthService service;

  AuthReducer(this.service) {
    on(() => [checkAuthAction], _checkAuth);
    on(() => [loginWithEmailAction], _loginWithEmail);
    on(() => [logoutAction], _logout);
    on(() => [recoveryPasswordAction], _recoveryPassword);
    on(() => [createUserAction], _createUser);
  }
  _recoveryPassword() {
    authState.value = LoadingAuth();
    final email = recoveryPasswordAction.value;
    service.recoveryPassword(email);
  }

  _checkAuth() {
    authState.value = LoadingAuth();
    service.checkAuth().then(authState.setValue);
  }

  _loginWithEmail() {
    authState.value = LoadingAuth();
    final dto = loginWithEmailAction.value;
    service.loginWithEmail(dto).then((x) => {
          x.fold((success) => authState.setValue(success), (failure) {
            authState.setValue(Unlogged());
            AsukaSnackbar.alert(failure.errorMessage).show();
          }),
        });
  }

  _logout() {
    authState.value = LoadingAuth();
    service.logout().then(authState.setValue);
  }

  _createUser() {
    authState.value = LoadingAuth();
    final dto = createUserAction.value;
    service.createUser(dto).then((x) => {
          x.fold((success) => authState.setValue, (failure) {
            Unlogged();
          }),
        });
  }
}
