
import 'package:flutter/material.dart';

class ImagesPage extends StatefulWidget {

  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() {
    return _ImagesPageState();
  }

}

class _ImagesPageState extends State<ImagesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Imagens"),
      ),
    );
  }

}
