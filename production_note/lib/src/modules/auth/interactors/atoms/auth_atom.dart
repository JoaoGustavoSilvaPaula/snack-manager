import 'package:asp/asp.dart';
import 'package:production_note/src/modules/auth/interactors/dtos/user_dto.dart';

import '../dtos/email_credential_dto.dart';
import '../states/auth_state.dart';

// atom
final authState = Atom<AuthState>(
  InitAuth(),
  key: 'authState',
);

// actions
final checkAuthAction = Atom.action(key: 'checkAuthAction');

final loginWithEmailAction = Atom<EmailCredentialDTO>(
  EmailCredentialDTO(),
  key: 'loginWithEmailAction',
);

final logoutAction = Atom.action(
  key: 'logoutAction',
);

final recoveryPasswordAction = Atom<String>(
  '',
  key: 'recoveryPassword',
);

final createUserAction = Atom<UserDto>(
  UserDto(),
  key: 'createUserAction',
);
