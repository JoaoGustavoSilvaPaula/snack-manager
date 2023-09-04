import 'package:flutter/material.dart';

import '../../../auth/interactors/atoms/auth_atom.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)) //
        .whenComplete(checkAuthAction.call);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          'Snack Manager',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
