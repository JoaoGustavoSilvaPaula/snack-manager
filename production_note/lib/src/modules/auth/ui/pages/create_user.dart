import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:production_note/src/core/mixin/validations_mixin.dart';
import 'package:production_note/src/modules/auth/interactors/dtos/user_dto.dart';

import '../../../../core/widgets/my_text_form_field_widget.dart';
import '../../interactors/atoms/auth_atom.dart';
import '../../interactors/states/auth_state.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> with ValidationsMixin {
  var dto = UserDto();
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
                        'Criar Conta',
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
                    labelText: 'Nome',
                    validator: isNotEmpty,
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  MyTextFormField(
                    isLoading: isLoading,
                    onChanged: (value) => dto.password = value,
                    obscureText: true,
                    labelText: 'Senha',
                    validator: (val) => combine([
                      () => isNotEmpty(val),
                      () => hasSixChars(val),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                Modular.to.navigate('/auth/login');
                              },
                        child: const Text('Já tenho Conta'),
                      ),
                      FilledButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  createUserAction.value = dto;
                                }
                              },
                        child: const Text('Criar Conta'),
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
