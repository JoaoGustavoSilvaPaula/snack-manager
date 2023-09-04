import 'package:flutter_modular/flutter_modular.dart';
import 'package:production_note/src/modules/auth/ui/pages/create_user.dart';
import 'package:production_note/src/modules/auth/ui/pages/login_page.dart';

import 'data/services/firebase_auth_service.dart';
import 'interactors/reducers/auth_reducer.dart';
import 'interactors/services/auth_service.dart';

class AuthModule extends Module {
  @override
  List<Bind> get exportedBinds => [
        AutoBind.factory<AuthService>(FirebaseAuthService.new),
        AutoBind.singleton(AuthReducer.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/login',
          child: (_, __) => const LoginPage(),
        ),
        ChildRoute(
          '/create-user',
          child: (_, __) => const CreateUser(),
        )
      ];
}
