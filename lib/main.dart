import 'package:cadastro_tasks/models/dog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home.dart';
import 'repositories/db_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());


  DBRepository repository = DBRepository();
  // Create a Dog and add it to the dogs table
  var fido = const Dog(
    id: 1,
    name: 'Dog 1',
    age: 10,
  );

  await repository.insertDog(fido);

  print(await repository.dogs());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /// Comente este trecho do theme, caso queira voltar para 
      /// o layout anterior
      theme: ThemeData(
        //colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: false,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('pt')
      ],
      home: const Scaffold(
        body: Home()
      ),
    );
  }
}
