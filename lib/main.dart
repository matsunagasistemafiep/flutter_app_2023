import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /// Comente este trecho do theme, caso queira voltar para 
      /// o layout anterior
      theme: ThemeData(
        //colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: false,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('pt')
      ],
      home: const Scaffold(
        body: Splash()
      ),
    );
  }
}
