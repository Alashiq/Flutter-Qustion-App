import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qustionsapp/controllers/user_controller.dart';
import 'package:qustionsapp/public_models/loading.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loading = Provider.of<LoadingModel>(context, listen: true);
    var user = Provider.of<UserController>(context, listen: true);

    return Scaffold(
      backgroundColor: Color(0xffdedede),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff565656),
              ),
              onPressed: () {
                Get.offNamed('/');
              })
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "مستخدم جديد",
          style: TextStyle(color: Color(0xff565656)),
        ),
      ),
      body: LoadingBox(
        child: SingleChildScrollView(
          child:Expanded(child:  Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // FirstName Input
                  TextField(
                    controller: user.firstNameRg,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'الإسم',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, right: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  // Last Name Input
                  TextField(
                    controller: user.lastNameRg,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'اللقب',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, right: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  // Login Name Input
                  TextField(
                    controller: user.loginNameRg,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'إسم الدخول',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, right: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  // Email Input
                  TextField(
                    controller: user.emailRg,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'البريد الإلكتروني',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, right: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Email Input
                  TextField(
                    controller: user.phoneRg,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'رقم الهاتف',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, right: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Password Input
                  TextField(
                    controller: user.passwordRg,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'كلمة المرور',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, right: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // Button Login
                  Container(
                    height: 56,
                    width: 240,
                    child: RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text(
                        "تسجيل",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        loading.start();
                        await user.register();
                        loading.stop();
                      },
                    ),
                  )
                ],
              ),
              ),
          ),
        ),
      ),
    );
  }
}
