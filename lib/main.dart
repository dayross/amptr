import 'package:amptr/config/config.dart';
import 'package:amptr/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Environment.initEnvironment();
  
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const ButtonScreen()
      // home: const DailySongScreen()
    );
  }
}
