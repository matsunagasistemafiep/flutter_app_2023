
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationPage extends StatefulWidget {

  const GeolocationPage({super.key});

  @override
  State<GeolocationPage> createState() {
    return _GeolocationPageState();
  }

}

class _GeolocationPageState extends State<GeolocationPage> {
  
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<Position> positionStream;
  String status = 'Aguardando GPS';
  late Position positionLocation;

  @override
  void initState() {
    obterLocalizacaoAtual();
    super.initState();
  }

  /// Método para obter a localização atual, considerando as permissões
  obterLocalizacaoAtual() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isDenied) {
      print("Parece que você não permitiu o uso do GPS, abra as configurações do aplicativo e libere a permissão");
    }
    else {
      bool gpsIsEnabled = await Geolocator.isLocationServiceEnabled();
      if (!gpsIsEnabled) {
        print('Seu GPS está desligado, para obter a localicação ative-o.');
      }
      positionStream = Geolocator.getPositionStream().listen((Position position) async {
        if(positionLocation == null){
          positionLocation = position;
          setState(() {
            status = 'Localização obtida';
            print('Latitude: ${positionLocation.latitude.toString()}');
            print('Longitude: ${positionLocation.longitude.toString()}');
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geolocalização"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.gps_fixed),
        onPressed: () {
          obterLocalizacaoAtual();
        },
      ),
    );
  }

}
