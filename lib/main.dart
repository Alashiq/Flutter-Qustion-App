import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qustionsapp/controllers/user_controller.dart';
import 'package:qustionsapp/public_models/loading.dart';
import 'package:qustionsapp/view/add_qustion_screen.dart';
import 'package:qustionsapp/view/home_screen.dart';
import 'package:qustionsapp/view/login_screen.dart';
import 'package:get/get.dart';
import 'package:qustionsapp/view/my_qustions_screen.dart';
import 'package:qustionsapp/view/profile_screen.dart';
import 'package:qustionsapp/view/register_screen.dart';
import 'package:qustionsapp/view/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingModel>.value(
          value: LoadingModel(),
        ),
        ChangeNotifierProvider<UserController>.value(
          value: UserController(),
        ),
      ],
      child: GetMaterialApp(
        builder: BotToastInit(), 

        debugShowCheckedModeBanner: false,
        title: 'Qustions App',
        initialRoute: '/',

        routes: {
          '/': (context) => WelcomeScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
          '/myqustion': (context) => MyQustionsScreen(),
          '/add': (context) => AddQustionScreen(),
          '/profile': (context) => ProfileScreen(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.tajawalTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}
