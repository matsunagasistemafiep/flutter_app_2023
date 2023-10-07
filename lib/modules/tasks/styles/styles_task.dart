import 'package:flutter/material.dart';

class StylesTask {
  static ButtonStyle buttonStyle(double width) {
    return ButtonStyle(
      // MediaQuery.of(context).size.width é a largura da tela do celular
      // *0.75 indica que é 75% da largura
      fixedSize: MaterialStatePropertyAll(Size(width, 50)),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      backgroundColor: const MaterialStatePropertyAll(Colors.greenAccent)
    );
  }
}