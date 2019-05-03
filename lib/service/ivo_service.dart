import 'package:flutter/foundation.dart';
import 'package:ivo/model/ivo.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class IvoService {
  //recebe as informacoes do Webservice
  static Future<List<Ivo>> getIvo() async {
    final response = await http.get('http://mobile.semfios.pt/getdata.php');
    
    //retorna os dados do Json e já atribui ao Model.
    return compute(parseIvo, response.body);
  }

  static List<Ivo> parseIvo(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Ivo>((json) => Ivo.fromJson(json)).toList();
  }
}
