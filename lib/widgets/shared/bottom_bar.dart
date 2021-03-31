import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  final int active;
  const BottomBar({this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 2.00),
            color: Color(0xff000000).withOpacity(0.07),
            blurRadius: 4,
          ),
        ],
      ),
      width: double.infinity,
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 56,
              alignment: Alignment.center,
              child: active==1? Column(
                children: [Icon(Icons.home,color: Colors.red,), Text("الرئيسية",style: TextStyle(color: Colors.red),)],
              ):
              InkWell(
                child: Column(
                children: [Icon(Icons.home), Text("الرئيسية")],
              ),
              onTap: (){
                    Get.offNamed('/home');
              },
              ),
            ),
          ),
                    Expanded(
            child: Container(
              height: 56,
              alignment: Alignment.center,
              child: active==2? Column(
                children: [Icon(Icons.question_answer_outlined,color: Colors.red,), Text("أسئلتي",style: TextStyle(color: Colors.red),)],
              ):
              InkWell(
                child: Column(
                children: [Icon(Icons.question_answer_outlined), Text("أسئلتي")],
              ),
              onTap: (){
                    Get.offNamed('/myqustion');
              },
              ),
            ),
          ),
                              Expanded(
            child: Container(
              height: 56,
              alignment: Alignment.center,
              child: active==3? Column(
                children: [Icon(Icons.add,color: Colors.red,), Text("أضف سؤال",style: TextStyle(color: Colors.red),)],
              ):
              InkWell(
                child: Column(
                children: [Icon(Icons.add), Text("أضف سؤال")],
              ),
              onTap: (){
                    Get.offNamed('/add');
              },
              ),
            ),
          ),

                              Expanded(
            child: Container(
              height: 56,
              alignment: Alignment.center,
              child: active==4? Column(
                children: [Icon(Icons.person,color: Colors.red,), Text("حسابي",style: TextStyle(color: Colors.red),)],
              ):
              InkWell(
                child: Column(
                children: [Icon(Icons.person), Text("حسابي")],
              ),
              onTap: (){
                    Get.offNamed('/profile');
              },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
