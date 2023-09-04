import 'package:firebase_auth/firebase_auth.dart';
import 'package:production_note/src/modules/auth/interactors/dtos/user_dto.dart';

import '../../interactors/dtos/email_credential_dto.dart';
import '../../interactors/entities/tokenization.dart';
import '../../interactors/services/auth_service.dart';
import '../../interactors/states/auth_state.dart';

class FirebaseAuthService extends AuthService {
  final FirebaseAuth auth;

  FirebaseAuthService(this.auth);

  @override
  Future<AuthState> checkAuth() async {
    final token = await auth.currentUser?.getIdToken();
    if (token == null) {
      return Unlogged();
    } else {
      final tokenization = Tokenization(idToken: token);
      return Logged(tokenization);
    }
  }

  @override
  Future<AuthState> loginWithEmail(EmailCredentialDTO dto) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: dto.email,
        password: dto.password,
      );
      return checkAuth();
    } catch (e) {
      return Unlogged();
    }
  }

  @override
  Future<AuthState> logout() async {
    await auth.signOut();
    return Unlogged();
  }

  @override
  Future<AuthState> recoveryPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
    return Unlogged();
  }

  @override
  Future<AuthState> createUser(UserDto dto) async {
    await auth.createUserWithEmailAndPassword(
        email: dto.email, password: dto.password);

    return checkAuth();
  }
}
