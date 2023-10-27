
import 'package:flutter/material.dart';

class DeviceInfoPage extends StatefulWidget {

  const DeviceInfoPage({super.key});

  @override
  State<DeviceInfoPage> createState() {
    return _DeviceInfoPageState();
  }

}

class _DeviceInfoPageState extends State<DeviceInfoPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geolocalização"),
      ),
      body: Container(),
    );
  }

}
