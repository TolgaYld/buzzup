import 'package:buzzup/core/localization/localizations.dart';
import 'package:flutter/material.dart';

class TestScaffoldWrapper extends StatelessWidget {
  const TestScaffoldWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: L10n.localizationsDelegates,
      home: Scaffold(
        body: child,
      ),
    );
  }
}
