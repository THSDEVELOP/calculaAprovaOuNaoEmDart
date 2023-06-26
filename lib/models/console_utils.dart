import 'dart:convert';
import 'dart:io';

class ConsoleUtils {

  static lerString(){
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

    static lerStringcomTexto(String texto){
    print(texto);
    return lerString();
  }


  static double? lerDouble(){
    var value = lerString();
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }

  static double? lerDoublecomTextoComSaida(String texto, String valorDeSaida){
    do {
      try {
        var value = lerStringcomTexto(texto);
        if (value == valorDeSaida){
          return null;
        }
        return double.parse(value);
      } catch (e) {
        print(texto);
      }
    } while (true);
  }

  static double? lerDoublecomTexto(String texto){
    print(texto);
    return lerDouble();
  }
}