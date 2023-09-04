import 'package:flutter_modular/flutter_modular.dart';
import 'package:production_note/src/modules/customer/ui/pages/customer_page.dart';

class CustomerModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const CustomerPage(),
        ),
      ];
}
