import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qustionsapp/models/qustions_model.dart';
import 'package:qustionsapp/models/user_model.dart';
import 'package:qustionsapp/services/api/data_services.dart';

class UserController extends ChangeNotifier {
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

  //
  //
  //=========================> Register Function
  int homeState = 0; //0=> Not Load   -    1=> Loded    -   2=> SomeTing Wrong
  List<QustionsModel> qustionsList;
  Future<void> loadQustions() async {
    await Future.delayed(const Duration(seconds: 2));
    dynamic _resData = await DataApi().getQustionsAPI(user.token);
    if (_resData != null) {
      qustionsList = _resData.map<QustionsModel>((data) => QustionsModel.fromJson(data)).toList();
      homeState = 1;
      notifyListeners();
    } else {
      homeState = 2;
      notifyListeners();
    }
  }
}
