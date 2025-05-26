import 'dart:convert';

import 'package:hola_mundo/Services/globals.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  //!logica del
  static Future<http.Response> register(String name, email, password) async {
    Map data = {"name": name, "email": email, "password": password};
    var body = json.encode(data);
    var url = Uri.parse('${baseURL}auth/register');
    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.body);
    return response;
  }

  //!logica del login
  static Future<http.Response> Login(String email, password) async {
    Map data = {"email": email, "password": password};
    var body = json.encode(data);
    var url = Uri.parse("${baseURL}auth/login");
    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.body);
    return response;
  }
}
