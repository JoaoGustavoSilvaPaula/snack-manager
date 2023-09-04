import 'package:production_note/src/modules/auth/interactors/dtos/user_dto.dart';

import '../dtos/email_credential_dto.dart';
import '../states/auth_state.dart';

abstract class AuthService {
  Future<AuthState> loginWithEmail(EmailCredentialDTO dto);

  Future<AuthState> logout();

  Future<AuthState> checkAuth();

  Future<AuthState> recoveryPassword(String email);

  Future<AuthState> createUser(UserDto dto);
}
