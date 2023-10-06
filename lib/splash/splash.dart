import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../layout/bottombar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pop(context);
        Navigator.push(
          context, 
          MaterialPageRoute(
            //builder: (context) => TopBar()
            builder: (context) => BottomBar()
          )
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black87,
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.blueAccent,
              Colors.cyanAccent
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          /*RadialGradient(
            colors: [
              Colors.yellowAccent,
              Colors.yellow,
              Colors.red
            ]
          ),*/
          // Imagem de fundo
          /*image: DecorationImage(
            image: AssetImage("./assets/images/fundo.jpg")
          )*/
        ),
        /* Se estiver executando na Web (Chrome) */
        //child: Image.asset("/images/computer.png")
        /* Se estiver executando no Emulador Android */
        /*child: Image.asset(
          "./assets/images/computer.png"
        )*/
        child: Lottie.asset("./assets/images/animacao.json")
      )
    );
  }
}
