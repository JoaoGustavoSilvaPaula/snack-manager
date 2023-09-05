import 'package:firebase_auth/firebase_auth.dart';
import 'package:production_note/src/modules/auth/interactors/dtos/user_dto.dart';
import 'package:result_dart/result_dart.dart';

import '../../interactors/dtos/email_credential_dto.dart';
import '../../interactors/entities/tokenization.dart';
import '../../interactors/services/auth_service.dart';
import '../../interactors/states/auth_state.dart';
import '../erros/auth_failures.dart';

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
  AsyncResult<AuthState, AuthException> loginWithEmail(
      EmailCredentialDTO dto) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: dto.email,
        password: dto.password,
      );
      return Success(await checkAuth());
    } on FirebaseAuthException catch (_) {
      return Failure(AuthException("Usuário e senha Inválidos"));
    } on Exception catch (e) {
      return Failure(AuthException(e.toString()));
    }
  }

  @override
  Future<AuthState> logout() async {
    await auth.signOut();
    return Unlogged();
  }

  @override
  AsyncResult<AuthState, AuthException> recoveryPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
    return Success(Unlogged());
  }

  @override
  AsyncResult<AuthState, AuthException> createUser(UserDto dto) async {
    await auth.createUserWithEmailAndPassword(
        email: dto.email, password: dto.password);

    return Success(await checkAuth());
  }
}
