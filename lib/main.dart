import 'package:flutter/material.dart';
import 'core/config/router.dart';
import 'core/config/theme.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Techfis Asset Management',
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
