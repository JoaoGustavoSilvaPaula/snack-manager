import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/auth/auth_module.dart';
import 'modules/customer/customer_module.dart';
import 'modules/splash/ui/pages/splash_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.instance<FirebaseAuth>(FirebaseAuth.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/splash', child: (_, __) => const SplashPage()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/customer', module: CustomerModule()),
      ];
}
