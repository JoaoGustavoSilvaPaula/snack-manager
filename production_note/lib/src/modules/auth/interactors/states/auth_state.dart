import 'package:production_note/src/modules/auth/interactors/entities/tokenization.dart';

sealed class AuthState {}

class InitAuth implements AuthState {}

class LoadingAuth implements AuthState {}

class Logged implements AuthState {
  final Tokenization token;

  Logged(this.token);
}

class Unlogged implements AuthState {}

final class UnregisteredUserState implements AuthState {}

final class RegisteredUserState implements AuthState {}

final class RecoveryPasswordState implements AuthState {}
