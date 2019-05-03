import 'package:flutter/material.dart';
import 'package:ivo/screen/home.dart';


/*
Opa, ivo vou tentar te explicar um pouco

Diretorios:
  Model: Ficam as classes referente aos tipos de dados
  Screen: Todas as telas do app
  Service: Faz toda a parte de negocio, nesse caso recebe as informações do WebService

Eu utilizei a Lib http: ^0.12.0+2 que foi adicionada no pubspec.yaml. Responsável por trabalhar com Json e Webservice
Não me preocupei com críticas e verificação de erros, segui o caminho feliz.
*/

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: true,
    theme: ThemeData(
      accentColor: Colors.blue,
      hintColor: Colors.white,
      primaryColor: Colors.blueAccent,
    ),
  ));
}
