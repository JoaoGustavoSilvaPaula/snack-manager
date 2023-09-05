import 'package:string_validator/string_validator.dart' as string_validator;

mixin ValidationsMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? "Este campo é obrigatório!";

    return null;
  }

  String? hasSixChars(String? value, [String? message]) {
    if (value!.length < 6) {
      return message ?? "Você deve usar pelo menos 6 caracteres!";
    }

    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }

    return null;
  }

  String? isEmail(String? value, [String? message]) {
    if (value!.isNotEmpty && !string_validator.isEmail(value)) {
      return message ?? "Você deve informar um e-mail válido!";
    }
    return null;
  }
}
