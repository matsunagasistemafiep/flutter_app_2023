import 'package:flutter/material.dart';

import '../modules/calc/screens/calc.dart';
import '../modules/forms/screens/formulario.dart';
import '../modules/home/screens/home.dart';

class BottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomBarState();
  }
}

class BottomBarState extends State<BottomBar> {
  int abaSelecionada=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Bar"),
        centerTitle: true,
        leading: Icon(Icons.favorite),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: abaSelecionada,
        // Evento ativado quando uma aba for selecionada
        // index representa o índice da aba (0 a n-1)
        onDestinationSelected: (index) {
          setState(() {
            abaSelecionada = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Início",
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate_sharp),
            label: "Calculadora"
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Perfil"
          )
        ]
      ),
      body: [
        Home(),
        Calc(),
        Formulario()
      ][abaSelecionada]
    );
  }

}