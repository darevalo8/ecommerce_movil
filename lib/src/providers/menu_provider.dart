import 'dart:async';
import 'dart:convert';
import 'package:ecomerce_movil/src/model/menu_model.dart';
import 'package:http/http.dart' as http;


class MenuProvider {
  String _url = '69.20.52.167';
  
  Future<List<Jerarquia>> getMenu ()async{
    final url = Uri.http(_url, '/sj/expormenugerarquia.php',{
      'proyecto': 'android',
      'usuario': '1',
      'imei': '868219041021285',
      'vs': '4.0.0',
      'usu': '1'
    });
    final response = await http.get(url);
    final decodeData = json.decode(response.body);
    final menuList = Menu.fromJsonList(decodeData['jerarquia']);
    
    return menuList.items;
  }
}