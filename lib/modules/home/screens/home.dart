import 'package:flutter/material.dart';
import 'package:my_flutter_app/modules/home/widgets/my_list.dart';

import '../../calc/screens/calc.dart';
import '../../forms/screens/formulario.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {

  int abaSelecionada=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const MyList(),
        const Calc(),
        const Formulario()
      ][abaSelecionada], 

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
    );
  }

}