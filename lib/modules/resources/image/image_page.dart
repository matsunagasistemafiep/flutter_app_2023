import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  late SharedPreferences sharedPreferences;
  List<String>? fileListPath = [];

  @override
  initState() {
    atualizaImagens();
    super.initState();
  }

  void atualizaImagens() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      fileListPath = sharedPreferences.getStringList('imageList') ?? [];
      print(fileListPath);
    });
  }

  void saveImage(String path) async {
    // Obtain shared preferences.
    sharedPreferences = await SharedPreferences.getInstance();
    
    fileListPath!.add(path);
    sharedPreferences.setStringList('imageList', fileListPath!);
    print(fileListPath);
  }
  

  Future<void> pickImage(ImageSource source) async {
    try {
      // Abre a câmera ou galeria
      final imagepicker = await ImagePicker().pickImage(source: source);
      // Retorna a foto independente da origem
      if (imagepicker == null) return;

      // Salva a foto em um arquivo temporário
      final imageTemporary = File(imagepicker.path);
      
      // Selecionar um local para salvar o arquivo
      final Directory extDir = await getApplicationDocumentsDirectory();
      String dirPath = "${extDir.path}/${imageTemporary.name}";
      print(dirPath);
      // Salva o arquivo
      final File newImage = await imageTemporary.copy(dirPath);
      saveImage(dirPath);
      setState(() {
        imageFile = newImage;
        print("Image file ");
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
                      builder: (_) => AlertDialog(
                        title: const Text('Acionar uma nova imagem'),
                        content: Container(
                          margin: const EdgeInsets.all(2.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FilledButton(
                                child: const Row(children: [Icon(Icons.camera_alt), Text("Câmera")],),
                                onPressed: () async {
                                  // ImageSource.camera: tira uma foto
                                  await pickImage(ImageSource.camera).then((value) {
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                              FilledButton(
                                child: const Row(children: [Icon(Icons.photo), Text("Galeria")],),
                                onPressed: () async {
                                  // ImageSource.gallery: busca na galeria
                                  await pickImage(ImageSource.gallery).then((value) {
                                    Navigator.of(context).pop();
                                  });
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
            
            // Exibindo a lista de imagens
            const SizedBox(height: 10.0,),
            // Apenas mostra se tiver imagens na lista de paths
            if (fileListPath!.isNotEmpty) CarouselSlider.builder(
              itemCount: fileListPath!.length,
              itemBuilder: (BuildContext context, int index, int pageViewIndex) {
                File imageFile = File(fileListPath![index]);
                return Image.file(imageFile);
                //return Text(imageFile.name);
              }, 
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )
,
            )
          ],
        ),
      )
    );
  }

}
