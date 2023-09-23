import 'package:flutter/material.dart';

import 'home.dart';

void main() {
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
      home: const Scaffold(
        body: Home()
      ),
    );
  }
}
