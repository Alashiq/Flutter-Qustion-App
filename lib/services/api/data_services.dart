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

  // Register API
  Future<dynamic> registerAPI(String firstName, String lastName,
      String loginName, String email, String password, String phone) async {
    try {
      var response =
          await http.post(Uri.parse(baseUrl + 'auth/registration'), body: {
        'FirstName': firstName,
        'LastName': lastName,
        'LoginName': loginName,
        'Email': email,
        'Password': password,
        'Phone': phone,
      });

      var jsonData = json.decode(response.body);

      print("Success Registerd");
      return true;
    } on Exception catch (_) {
      print("error Register");
      return null;
    }
  }

// Get Qustions API
  Future<dynamic> getQustionsAPI(String token) async {
    try {
      var headers = {
        "Authorization": token,
      };
      var data =
          await http.get(Uri.parse(baseUrl + 'question/get'), headers: headers);
          print(data.statusCode);
      if (data.statusCode == 200) {
        return json.decode(data.body);
      }
    } on Exception catch (_) {
      return null;
    }
  }

//  End Data API
}
