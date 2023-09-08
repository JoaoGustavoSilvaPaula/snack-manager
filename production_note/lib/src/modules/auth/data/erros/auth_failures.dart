import 'package:production_note/src/core/execptions/exception.dart';

class AuthException extends Failure {
  AuthException(String? errorMessage)
      : super(
            errorMessage:
                errorMessage ?? "Problemas? Contate o suporte técnico!");
}
