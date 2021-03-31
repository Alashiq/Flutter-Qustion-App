import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qustionsapp/controllers/user_controller.dart';
import 'package:qustionsapp/public_models/loading.dart';
import 'package:qustionsapp/widgets/shared/bottom_bar.dart';

class MyQustionsScreen extends StatelessWidget {
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
              "أسئلتي",
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
              child:SingleChildScrollView(child:  Column(
                children: [
                  QustionItem(
                    qustion: "تجربة السؤال الثاني",
                  ),
                                    QustionItem(
                    qustion: "تجربة السؤال الثاني",
                  ),
                ],
              ),),
            ),
          ),
          bottomNavigationBar: BottomBar(
            active: 2,
          ),
        ));
  }
}

class QustionItem extends StatelessWidget {
  final String qustion;
  const QustionItem({this.qustion});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Text(
              qustion,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Container(
            height: 1,
            color: Color(0xffeeeeee),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("الإجابات"),
                    SizedBox(
                      width: 5,
                    ),
                    Text("5"),
                  ],
                )),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("التقييم"),
                    SizedBox(
                      width: 5,
                    ),
                    Text("3"),
                  ],
                )),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("تاريخ"),
                    SizedBox(
                      width: 5,
                    ),
                    Text("11-2-2020"),
                  ],
                )),
              ],
            ),
          ),
          Container(
            height: 48,
            width: 140,
            margin: EdgeInsets.fromLTRB(0, 4, 0, 12),
            child: RaisedButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Text("شاهد السؤال",style: GoogleFonts.cairo(fontSize: 16),),
              onPressed: (){
                print("enter qustion");
              },
            ),
          ),
        ],
      ),
    );
  }
}
