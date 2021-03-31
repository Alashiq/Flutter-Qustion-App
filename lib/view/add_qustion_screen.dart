import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qustionsapp/controllers/user_controller.dart';
import 'package:qustionsapp/public_models/loading.dart';
import 'package:qustionsapp/widgets/shared/bottom_bar.dart';

class AddQustionScreen extends StatelessWidget {
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
              "أضف سؤال",
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
              child: SingleChildScrollView(child: Column(
                children: [
                  // Qustion Tile
                  Container(
                    height: 86,
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: TextField(
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        hintText: 'عنوان السؤال',
                      ),
                    ),
                  ),
                  // End Qustion Tile

                  // Qustion Content
                  Container(
                    height: 140,
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      expands: true,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        hintText: 'شرح السؤال',
                      ),
                    ),
                  ),
                  // End Qustion Content

                  // Btn Add Qustion
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child:Container(
                      width: 200,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                      onPressed: () {},
                      child: Text("أضف السؤال"),
                    ),
                    ),
                  ),
                  // End Btn Add Qustion
                ],
              ),),
            ),
          ),
          bottomNavigationBar: BottomBar(
            active: 3,
          ),
        ));
  }
}
