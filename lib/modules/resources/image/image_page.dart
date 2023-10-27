import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


class ImagesPage extends StatefulWidget {

  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() {
    return _ImagesPageState();
  }

}
extension FileEx on File {
  String get name => path.split(Platform.pathSeparator).last;
}

class _ImagesPageState extends State<ImagesPage> {

  File? imageFile;

  

  Future<void> pickImage(ImageSource source) async {
    try {
      final imagepicker = await ImagePicker().pickImage(source: source);
      if (imagepicker == null) return;
      final imageTemporary = File(imagepicker.path);
      
      // getting a directory path for saving
      final Directory extDir = await getApplicationDocumentsDirectory();
      String dirPath = "${extDir.path}/images/";
      print(dirPath);

      final File newImage = await imageTemporary.copy(dirPath + imageTemporary.name);
      print(newImage);

      setState(() {
        imageFile = newImage;
        print(imageFile);
        
      });
    } catch (e) {
      return;
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Imagens")
      ),
      body: Container(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Material(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => Container(
                        height: MediaQuery.of(context).size.height*0.5,
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          elevation: 5,
                          margin: const EdgeInsets.all(2.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              OutlinedButton(
                                child: const Row(children: [Icon(Icons.camera_alt), Text("Câmera")],),
                                onPressed: () async {
                                  await pickImage(ImageSource.camera);
                                },
                              ),
                              OutlinedButton(
                                child: const Row(children: [Icon(Icons.photo), Text("Galeria")],),
                                onPressed: () async {
                                  await pickImage(ImageSource.gallery);
                                },
                              ),
                              OutlinedButton(
                                child: const Row(children: [Icon(Icons.close), Text("Fechar")],),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          )
                        )
                      )
                    );
                  },
                  child: const Text('Adicionar imagem'),
                ),
              ),
            ),
            Center(child: Image.file(imageFile!))
          ],
        ),
      )
    );
  }

}
