import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});
  @override
  State<ImagesPage> createState() {
    return _ImagesPageState();
  }
}

/// Cria uma extensão da classe File, para permitir pegar apenas o nome do arquivo.
extension FileEx on File {
  String get name => path.split(Platform.pathSeparator).last;
}

class _ImagesPageState extends State<ImagesPage> {

  File? imageFile;
  late SharedPreferences sharedPreferences;
  List<String>? fileListPath = [];
  bool imagemDefinida = false;

  @override
  void initState() {
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

  /// Realiza o salvamento do arquivo no SharedPreferences
  /// Variável: [imageList]
  void saveImage(String path) async {
    sharedPreferences = await SharedPreferences.getInstance();
    fileListPath = sharedPreferences.getStringList('imageList') ?? [];
    fileListPath!.add(path);
    sharedPreferences.setStringList('imageList', fileListPath!);
    print(fileListPath);
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final imagepicker = await ImagePicker().pickImage(source: source);
      if (imagepicker == null) return;
      final imageTemporary = File(imagepicker.path);

      // Obtém o diretório padrão do app, para armazenamento de arquivos internos
      final Directory extDir = await getApplicationDocumentsDirectory();
      // Define uma string com o diretório e a imagem
      String dirPath = "${extDir.path}/${imageTemporary.name}";
      // Copia a imagem temporária para o novo diretório definido
      final File newImage = await imageTemporary.copy(dirPath);
      saveImage(dirPath);
      setState(() {
        imageFile = newImage;
        print("Image file ");
        print(imageFile);
        imagemDefinida = true;
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Material(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Adicionar uma imagem'),
                        content: Column(
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
                    );
                  },
                  child: const Text('Adicionar imagem'),
                ),
              ),
            ),
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
