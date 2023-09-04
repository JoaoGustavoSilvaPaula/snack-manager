import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/widgets/my_text_form_field_widget.dart';
import '../../interactors/atoms/auth_atom.dart';
import '../../interactors/dtos/email_credential_dto.dart';
import '../../interactors/states/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var dto = EmailCredentialDTO();

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => authState.value);
    final isLoading = state is LoadingAuth;
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Snack Manager',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                MyTextFormField(
                  isLoading: isLoading,
                  onChanged: (value) {
                    dto.email = value;
                  },
                  labelText: 'E-mail',
                ),
                const SizedBox(height: 10),
                MyTextFormField(
                  isLoading: isLoading,
                  onChanged: (value) => dto.password = value,
                  obscureText: true,
                  labelText: 'Password',
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          loginWithEmailAction.value = dto;
                        },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => {
                        Modular.to.navigate('/auth/create-user'),
                      },
                      child: const Text('Criar Conta'),
                    ),
                    TextButton(
                      onPressed: () => {
                        Modular.to.navigate('/recovery-password'),
                      },
                      child: const Text('Esqueci minha senha'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
