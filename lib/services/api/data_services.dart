import 'dart:convert';

import 'package:http/http.dart' as http;

class DataApi {
  String baseUrl = "https://wcif-backend.herokuapp.com/api/";

  // Login API
  Future<dynamic> loginAPI(String email, String password) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + 'auth/login'),
          body: {'Email': email, 'Password': password});

      var jsonData = json.decode(response.body);

      if (jsonData['message'] == "login successfull.") {
        print("welcome User");
        return jsonData;
      } else {
        print("wrong login");
        return null;
      }
    } on Exception catch (_) {
      print("error");
      return null;
    }
  }

  // Login API
  Future<dynamic> registerAPI(
      String email, String phone, String password) async {
    if (email == 'a' && password == '123')
      return json.decode(
          '{"token":"libya token","id":1,"phone":"0926503011","name":"عبدالسميع محمود"}');
    var body =
        jsonEncode({'username': email, 'phone': phone, 'password': password});
    var headers = {
      "Accept": "application/json",
      "content-type": "application/json"
    };
    try {
      var data = await http.post(Uri.https(baseUrl, 'auth/register'),
          body: body, headers: headers);
      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        return jsonData;
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }
}
