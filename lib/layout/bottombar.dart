import 'package:flutter/material.dart';
import '../pages/calc.dart';
import '../pages/formulario.dart';
import '../pages/second.dart';

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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Menu"),
            ),
            ListTile(title: Text("Item 1")),
            ListTile(title: Text("Item 2")),
            ListTile(title: Text("Item 3")),
          ],
        )
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
        Second(),
        Calc(),
        Formulario()
      ][abaSelecionada]
    );
  }

}