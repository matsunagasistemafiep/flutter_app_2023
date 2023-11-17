import 'dart:math';

class CalcModel {
  int n1;
  int n2;

  CalcModel({
    required this.n1,
    required this.n2
  });

  int somar() {
    return n1+n2;
  }
  
  int subtrair() {
    return n1-n2;
  }
  
  int multiplicar() {
    return n1*n2;
  }
  
  double dividir() {
    return n1/n2;
  }
  
  num potencia() {
    return pow(n1, n2);
  }

}