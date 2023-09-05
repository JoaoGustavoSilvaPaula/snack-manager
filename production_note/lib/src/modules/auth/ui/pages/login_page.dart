import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:production_note/src/core/mixin/validations_mixin.dart';

import '../../../../core/widgets/my_text_form_field_widget.dart';
import '../../interactors/atoms/auth_atom.dart';
import '../../interactors/dtos/email_credential_dto.dart';
import '../../interactors/states/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationsMixin {
  var dto = EmailCredentialDTO();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => authState.value);
    final isLoading = state is LoadingAuth;
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
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
                    validator: (val) => combine([
                      () => isNotEmpty(val),
                      () => isEmail(val),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    isLoading: isLoading,
                    onChanged: (value) => dto.password = value,
                    obscureText: true,
                    labelText: 'Password',
                    validator: (val) => combine([
                      () => isNotEmpty(val),
                      () => hasSixChars(val),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              loginWithEmailAction.value = dto;
                            }
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
      ),
    );
  }
}
