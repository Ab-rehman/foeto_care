import 'package:flutter/material.dart';
import 'package:foeto_care/Screens/bottom_navbar_screen.dart';
import 'package:foeto_care/Screens/doctorScreen.dart';
import 'package:foeto_care/Screens/initialiseValuesScreen.dart';
import 'package:foeto_care/Screens/logInScreen.dart';
import 'package:foeto_care/Screens/mother_screen.dart';
import 'package:foeto_care/Screens/signUpDoctorScreen.dart';
import 'package:foeto_care/Screens/signUpMotherScreen.dart';
import 'package:foeto_care/Screens/signUpScreen.dart';
import 'package:foeto_care/Screens/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foeto Care',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcomeScreen',
      routes: {
        'welcomeScreen': (context) => WelcomeScreen(),
        'logInScreen': (context) => LogInScreen(),
        'signUpScreen': (context) => SignUpScreen(),
        'signUpDoctorScreen': (context) => SignUpDoctorScreen(),
        'signUpMotherScreen': (context) => SignUpMotherScreen(),
        'bottom_navbar_screen': (context) => BottomNavBarScreen(),
        'doctorScreen': (context) => DoctorScreen(),
        'mother_screen': (context) => MotherScreen(),
        'initialiseValuesScreen': (context) => InitialiseValuesScreen(),
      },
    );
  }
}


