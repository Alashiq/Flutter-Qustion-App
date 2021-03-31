import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qustionsapp/controllers/user_controller.dart';
import 'package:qustionsapp/public_models/loading.dart';

class LoginScreen extends StatelessWidget {
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
          "تسجيل الدخول",
          style: TextStyle(color: Color(0xff565656)),
        ),
      ),
      body: LoadingBox(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Email Input
                TextField(
                  controller: user.emailIn,
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
                // Password Input
                TextField(
                  controller: user.passwordIn,
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
                  child: Text("تسجيل الدخول",style:TextStyle(fontSize: 20),),
                  onPressed: () async {
                    loading.start();
                    await user.login();
                    loading.stop();
                  },
                ),
                )
              ],
            )),
      ),
    );
  }
}
