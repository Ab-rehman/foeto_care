import 'package:flutter/material.dart';
import 'package:foeto_care/Screens/bottom_navbar_screen.dart';
import 'package:foeto_care/Services/foetusVitalsJson.dart';
import 'package:foeto_care/Services/motherVitalsJson.dart';

List<double> mothersVitals = [];
List<double> foetusVitals = [];
List<String> motherTimeStamp = [];
List<String> foetusTimeStamp = [];

class InitialiseValuesScreen extends StatelessWidget {
  const InitialiseValuesScreen({Key? key}) : super(key: key);

  Future<String> initialiseValues() async {
    return Future.delayed(Duration.zero, () async {
      MothersVitals mothersVitalsClassObject = MothersVitals();
      FoetusVitals foetusVitalsClassObject = FoetusVitals();
      mothersVitals = await mothersVitalsClassObject.getMothersVitals();
      foetusVitals = await foetusVitalsClassObject.getFoetusVitals();
      motherTimeStamp = await mothersVitalsClassObject.getTimeStamp();
      foetusTimeStamp = await foetusVitalsClassObject.getTimeStamp();
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
