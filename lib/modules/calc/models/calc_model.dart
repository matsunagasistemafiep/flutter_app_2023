import 'dart:math';

class CalcModel {
  num n1;
  num n2;

  CalcModel({
    required this.n1,
    required this.n2
  });

  num somar() {
    return n1+n2;
  }
  
  num subtrair() {
    return n1-n2;
  }
  
  num multiplicar() {
    return n1*n2;
  }
  
  num dividir() {
    return n1/n2;
  }
  
  num potencia() {
    return pow(n1, n2);
  }

}