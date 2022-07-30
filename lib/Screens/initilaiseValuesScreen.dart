import 'package:flutter/material.dart';
import 'package:foeto_care/Screens/bottom_navbar_screen.dart';
import 'package:foeto_care/Services/motherVitalsJson.dart';

List<double> mothersVitals = [];

class InitialiseValuesScreen extends StatelessWidget {
  const InitialiseValuesScreen({Key? key}) : super(key: key);

  Future<String> initialiseValues() async {
    return Future.delayed(Duration.zero, () async {
      MothersVitals mothersVitalsClassObject = MothersVitals();
      mothersVitals = await mothersVitalsClassObject.getMothersVitals();
      mothersVitals.forEach((element) {print(element);});
      return "true";
    });

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialiseValues(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: Colors.black,
            );
          } else if(snapshot.connectionState == ConnectionState.done) {
            return BottomNavBarScreen();
          } else {
            return Text('State: ${snapshot.connectionState}');
          }///Main Screen
        },);
  }
}
