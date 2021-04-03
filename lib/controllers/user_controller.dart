import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qustionsapp/models/user_model.dart';
import 'package:qustionsapp/services/api/data_services.dart';

class UserController extends ChangeNotifier {
  UserModel userCatch;
  UserModel user;
  //
  //
  //
  //=========================> Login Function
  final emailIn = TextEditingController();
  final passwordIn = TextEditingController();
  Future<void> login() async {
    print(emailIn.text);
    print(passwordIn.text);
    dynamic _resData = await DataApi().loginAPI(emailIn.text, passwordIn.text);
    if (_resData != null) {
      user = UserModel.fromJson(_resData);
      Get.offNamed('/home');
      print(user.token);
    }
    notifyListeners();
  }

  //
  //
  //
  //=========================> Register Function
  final firstNameRg = TextEditingController();
  final lastNameRg = TextEditingController();
  final loginNameRg = TextEditingController();
  final emailRg = TextEditingController();
  final phoneRg = TextEditingController();
  final passwordRg = TextEditingController();
  Future<void> register() async {
    print(emailIn.text);
    dynamic _resData = await DataApi().registerAPI(
        firstNameRg.text,
        lastNameRg.text,
        loginNameRg.text,
        emailRg.text,
        passwordRg.text,
        phoneRg.text);
    if (_resData != null) {
      Get.offNamed('/');
    }
    notifyListeners();
  }
}
