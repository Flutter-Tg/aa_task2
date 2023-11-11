import 'package:aa_task2/commond/locator/locator.dart';
import 'package:aa_task2/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const ProviderScope(child: MaterialApp(home: MainApp())));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
