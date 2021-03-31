import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qustionsapp/controllers/user_controller.dart';
import 'package:qustionsapp/public_models/loading.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loading = Provider.of<LoadingModel>(context, listen: true);
    var user = Provider.of<UserController>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.orange,
      body: LoadingBox(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Button Login
               Container(
                 height: 56,
                 width: 220,
                 child:  RaisedButton(
                   color: Colors.red,
                   textColor: Colors.white,
                  child: Text("تسجيل الدخول",style: TextStyle(fontSize: 18),),
                  onPressed: () async {
                    Get.offNamed('/login');
                  },
                ),
               ),

                SizedBox(
                  height: 15,
                ),
                Text("أو",style: TextStyle(color: Colors.white,fontSize: 20),),
                
                SizedBox(
                  height: 15,
                ),
                // Button Login
               Container(
                 height: 56,
                 width: 220,
                 child:  RaisedButton(
                   color: Colors.blue,
                   textColor: Colors.white,
                  child: Text("مستخدم جديد",style: TextStyle(fontSize: 18),),
                  onPressed: () async {
                    Get.offNamed('/register');
                  },
                ),
               ),


              ],
            )),
      ),
    );
  }
}
