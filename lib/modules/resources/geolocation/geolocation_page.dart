
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
  var myLocationInfo;
  late Placemark place = Placemark();
  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    atualizarLocalizacao();
    super.initState();
  }

  atualizarLocalizacao() {
    service.getPosition().then((position) {
      print(position);
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
      service.getLocationInfo(position).then((value) {
        print(value);
        setState(() {
          place = value![0];
          print('${place.street}, ${place.subLocality}, ${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.postalCode}');
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
      body: Center(
        child: Column(
          children: [
            Text('${place.street}, ${place.subLocality}, ${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.postalCode}'),
            Text("$latitude, $longitude"),
            FilledButton(
              onPressed: () async {
                Uri myURL = Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
                if (!await canLaunchUrl(myURL)) {
                  launchUrl(myURL);
                }
              }, 
              child: const Text("Abrir mapa")
            )
          ],
        )
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
