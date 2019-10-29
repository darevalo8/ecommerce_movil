import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class UserProvider{
  String _url = "proyecto.darevalo.me";
  bool _cargando = false;

  Future login(String username, String password) async{
    final url = Uri.http(_url, '/api/login');
    final response = await http.post(url, body: {'username':username, 'password': password});
    final decodeData = json.decode(response.body);
    print(response.statusCode);
    print(decodeData);
    

    if(response.statusCode == 401 ){
      return 'Usuario y contraseña invalidos';
    }

    return '';
  }
}
