import 'package:flutter/material.dart';
import 'package:my_flutter_app/modules/calc/models/calc_model.dart';

List<String> operationList = <String>['Somar', 'Subtrair', 'Multiplicar', 'Dividir', 'Elevar'];

class Calc extends StatefulWidget {
  
  const Calc({super.key});

  @override
  State<Calc> createState() => CalcState();
}

class CalcState extends State<Calc> {

  num myVar = 0;
  TextEditingController control1 = TextEditingController(text: "0");
  TextEditingController control2 = TextEditingController(text: "0");

  CalcModel calcModel = CalcModel(n1: 0, n2: 0);
  
  String dropdownValue = operationList.first;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0, horizontal: 30.0
          ),
          child: TextField(
            controller: control1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Primeiro valor"
            )
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0, horizontal: 30.0
          ),
          child: TextField(
            controller: control2,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Segundo valor"
            )
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.calculate),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: operationList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              child: const Text("Calcular"),
              onPressed: () {
                calcModel.n1 = num.parse(control1.text);
                calcModel.n2 = num.parse(control2.text);

                setState(() {
                  if (dropdownValue=='Somar') {
                    myVar = calcModel.somar();
                  } else if (dropdownValue=='Subtrair') {
                    myVar = calcModel.subtrair();
                  } else if (dropdownValue=='Multiplicar') {
                    myVar = calcModel.multiplicar();
                  } else if (dropdownValue=='Dividir') {
                    myVar = calcModel.dividir();
                  } else if (dropdownValue=='Elevar') {
                    myVar = calcModel.potencia();
                  }
                });
              }
            ),   
          ],
        ),
        
        /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: const Text("Somar"),
              onPressed: () {
                int n1 = int.parse(control1.text);
                int n2 = int.parse(control2.text);
                setState(() {
                  myVar = n1+n2;
                });
              }
            ),
            ElevatedButton(
              child: const Text("Subtrair"),
              onPressed: () {
                int n1 = int.parse(control1.text);
                int n2 = int.parse(control2.text);
                setState(() {
                  myVar = n1-n2;
                });
              }
            ),
          ]
        ),*/
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            "$myVar",
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 45.0,
              fontWeight: FontWeight.bold
            )
          )
        )
        
      ]
    ));
  }

}