import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  int abaSelecionada=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Bar"),
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  Vibration.vibrate(
                    pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
                    intensities: [0, 120, 0, 255, 0, 64, 0, 255]
                  );
                },
                child: const Text("Vibrar")
              ),
              OutlinedButton(
                onPressed: () {
                  Vibration.cancel();
                },
                child: const Text("Parar", style: TextStyle(color: Colors.redAccent),)
              )
            ],
          )
        )
      )
    );
  }

}