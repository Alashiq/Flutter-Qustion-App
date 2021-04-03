import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qustionsapp/controllers/user_controller.dart';
import 'package:qustionsapp/public_models/loading.dart';
import 'package:qustionsapp/widgets/shared/bottom_bar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loading = Provider.of<LoadingModel>(context, listen: true);
    var user = Provider.of<UserController>(context, listen: true);

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Color(0xffeeeeee),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "حسابي",
              style: TextStyle(color: Color(0xff565656)),
            ),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Color(0xff565656),
                  ),
                  onPressed: () {
                    Get.offNamed('/');
                  }),
            ],
          ),
          body: LoadingBox(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Container(
                height: 260,
                alignment: Alignment.center,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
// First Name
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "الإسم",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(width: 50),
                            Text(
                              user.user.firstName,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      // Last Name
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffeeeeeee),
                      ),
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "اللقب",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(width: 50),
                            Text(
                              user.user.lastName,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
// Phone

                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffeeeeeee),
                      ),

                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "الهاتف",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(width: 50),
                            Text(
                              user.user.phone,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),

                      // Last Name

                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffeeeeeee),
                      ),
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "إسم الدخول",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(width: 50),
                            Text(
                              user.user.loginName,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomBar(
            active: 4,
          ),
        ));
  }
}
