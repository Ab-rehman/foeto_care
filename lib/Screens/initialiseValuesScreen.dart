import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foeto_care/Screens/bottom_navbar_screen.dart';
import 'package:foeto_care/Services/foetusVitalsJson.dart';
import 'package:foeto_care/Services/motherVitalsJson.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

List<double> mothersVitals = [];
List<double> foetusVitals = [];
List<String> motherTimeStamp = [];
List<String> foetusTimeStamp = [];
Timer? timer;
int value = 0;

class InitialiseValuesScreen extends StatefulWidget {
  const InitialiseValuesScreen({Key? key}) : super(key: key);

  @override
  State<InitialiseValuesScreen> createState() => _InitialiseValuesScreenState();
}

class _InitialiseValuesScreenState extends State<InitialiseValuesScreen> {
  spinnerFunction(Timer timer) {
    setState(() {
      value = value + 1;
      if (value == 100) {
        value = 0;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //timer = Timer.periodic(Duration.zero, spinnerFunction);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //timer?.cancel();
  }

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
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/welcomescreenbg.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Color(0xffFF4081),
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: LiquidLinearProgressIndicator(
                    value: 60 / 100,
                    // Defaults to 0.5.
                    valueColor: AlwaysStoppedAnimation(Colors.pink.shade400),
                    // Defaults to the current Theme's accentColor.
                    backgroundColor: Colors.transparent,
                    // Defaults to the current Theme's backgroundColor.
                    borderColor: Colors.transparent,
                    borderWidth: 5.0,
                    borderRadius: 30.0,
                    direction: Axis.vertical,
                    // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                    center: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                      child: Image.asset(
                        'images/mother.png',
                        width: MediaQuery.of(context).size.width * 0.20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return BottomNavBarScreen();
        } else {
          return Text('State: ${snapshot.connectionState}');
        }

        ///Main Screen
      },
    );
  }
}
