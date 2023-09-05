import 'package:flutter_modular/flutter_modular.dart';
import 'package:production_note/src/modules/home/ui/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const HomePage(),
    ),
  ];
}
