import 'package:production_note/src/modules/auth/interactors/dtos/user_dto.dart';
import 'package:result_dart/result_dart.dart';

import '../../data/erros/auth_failures.dart';
import '../dtos/email_credential_dto.dart';
import '../states/auth_state.dart';

abstract class AuthService {
  AsyncResult<AuthState, AuthException> loginWithEmail(EmailCredentialDTO dto);

  Future<AuthState> logout();

  Future<AuthState> checkAuth();

  AsyncResult<AuthState, AuthException> recoveryPassword(String email);

  AsyncResult<AuthState, AuthException> createUser(UserDto dto);
}
