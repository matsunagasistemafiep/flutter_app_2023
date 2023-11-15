
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:my_flutter_app/modules/resources/geolocation/services/geolocation_service.dart';
import 'package:url_launcher/url_launcher.dart';

class GeolocationPage extends StatefulWidget {

  const GeolocationPage({super.key});

  @override
  State<GeolocationPage> createState() {
    return _GeolocationPageState();
  }

}

class _GeolocationPageState extends State<GeolocationPage> {

  GeolocationService service = GeolocationService();
  late Placemark place;
  double latitude = 0.0;
  double longitude = 0.0;
  String enderecoAtual = "";
  bool localizacaoDefinida = false;

  @override
  void initState() {
    atualizarLocalizacao();
    super.initState();
  }

  atualizarLocalizacao() {
    setState(() {
      localizacaoDefinida = false;
    });
    /// getPosition(): captura a latitude e longitude de acordo com o GPS
    /// e armazena na variável {position}
    service.getPosition().then((position) {
      print(position);
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
      /// getLocationInfo(postion): obtém os dados da localização (endereço completo)
      service.getLocationInfo(position).then((value) {
        print(value);
        place = value![0];
        setState(() {
          enderecoAtual = '${place.street}, ${place.subLocality}, ${place.administrativeArea}, ${place.postalCode}';
          print(enderecoAtual);
          localizacaoDefinida = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geolocalização"),
      ),
      body: (localizacaoDefinida) ? Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () async {
                Uri myURL = Uri(
                  scheme: 'https',
                  path: "www.google.com.br/maps",
                  queryParameters: {
                    'q': "$latitude, $longitude"
                  } 
                );
                //if (!await canLaunchUrl(myURL)) {
                  launchUrl(myURL);
                //}
              }, 
              child: Text("$latitude, $longitude")
            ),
          ),
          Center(
            child: Text(enderecoAtual)
          )
        ],
      ) : 
      const Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.gps_fixed),
        onPressed: () {
          atualizarLocalizacao();
        },
      ),
    );
  }

}
