
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:my_flutter_app/modules/resources/geolocation/services/geolocation_service.dart';

class GeolocationPage extends StatefulWidget {

  const GeolocationPage({super.key});

  @override
  State<GeolocationPage> createState() {
    return _GeolocationPageState();
  }

}

class _GeolocationPageState extends State<GeolocationPage> {

  GeolocationService service = GeolocationService();
  var myLocationInfo;
  late Placemark place;

  @override
  void initState() {
    atualizarLocalizacao();
    super.initState();
  }

  atualizarLocalizacao() {
    service.getPosition().then((position) {
      print(position);
      service.getLocationInfo(position).then((value) {
        print(value);
        place = value![0];
        print('${place.street}, ${place.subLocality}, ${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.postalCode}');
      });
    });
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
          atualizarLocalizacao();
        },
      ),
    );
  }

}
