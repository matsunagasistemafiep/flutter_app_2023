
import 'package:flutter/material.dart';

class GeolocationPage extends StatefulWidget {

  const GeolocationPage({super.key});

  @override
  State<GeolocationPage> createState() {
    return _GeolocationPageState();
  }

}

class _GeolocationPageState extends State<GeolocationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geolocalização"),
      ),
    );
  }

}
