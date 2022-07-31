import 'dart:async';
import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:foeto_care/Screens/bottom_navbar_screen.dart';
import 'package:foeto_care/Services/motherVitalsJson.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'dart:math' as math;

import 'initialiseValuesScreen.dart';

class MotherScreen extends StatefulWidget {
  const MotherScreen({Key? key}) : super(key: key);

  @override
  State<MotherScreen> createState() => _MotherScreenState();
}

MothersVitals mothersVitalsClassObject = MothersVitals();
Timer? timer, timer1;
List<double> data = [28, 30, 12, 50, 2];
String date = motherTimeStamp.elementAt(motherTimeStamp.length-1);
double val = mothersVitals.elementAt(mothersVitals.length - 1);
double avg =
    mothersVitals.map((m) => m).reduce((a, b) => a + b) / mothersVitals.length;

class _MotherScreenState extends State<MotherScreen> {
  updateData(Timer timer) {
    setState(() {
      val = mothersVitals.elementAt(mothersVitals.length - 1);
      avg = mothersVitals.map((m) => m).reduce((a, b) => a + b) /
          mothersVitals.length;
      date = motherTimeStamp.elementAt(motherTimeStamp.length-1);
    });
  }

  updateDataSource(Timer timer) async {
    // mothersVitals = await mothersVitalsClassObject.getMothersVitals();
    //motherTimeStamp = await mothersVitalsClassObject.getTimeStamp();
    var temp = Random().nextInt(80);
    var len = mothersVitals.length;
    mothersVitals.add(double.parse(temp.toString()));
    var newlen = mothersVitals.length;
    for (; len < newlen; len++) mothersVitals.removeAt(0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getMotherVitals();
    timer = Timer.periodic(Duration(milliseconds: 3000), updateDataSource);
    timer1 = Timer.periodic(Duration(milliseconds: 3000), updateData);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
    timer1?.cancel();
  }

  var _val = 45;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c1d21),
        title: Text(
          "Foeto Care",
          style: GoogleFonts.barlow(
              fontSize: screenSize.height * 0.3 * 0.09,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Color(0xff101110),
          height: screenSize.height,
          width: screenSize.width,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                Container(
                  height: screenSize.height * 0.32,
                  width: screenSize.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff1c1d21),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenSize.height * 0.3 * 0.07),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Heart rate",
                              style: GoogleFonts.barlow(
                                color: Colors.white,
                                fontSize: screenSize.height * 0.3 * 0.09,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              date,
                              style: GoogleFonts.barlow(
                                color: Colors.grey.shade600,
                                fontSize: screenSize.height * 0.3 * 0.06,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite_sharp,
                                  size: screenSize.height * 0.3 * 0.13,
                                  color: Colors.red,
                                ),
                                Text(
                                  " ${val.toInt()}",
                                  style: GoogleFonts.barlow(
                                    color: Colors.white,
                                    fontSize: screenSize.height * 0.3 * 0.15,
                                  ),
                                ),
                                Text(
                                  " BPM",
                                  style: GoogleFonts.barlow(
                                    color: Colors.white,
                                    fontSize: screenSize.height * 0.3 * 0.06,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: screenSize.width * 0.9 * 0.48,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SfSlider(
                                    min: 0.0,
                                    max: 24.0,
                                    value: 8,
                                    interval: 8,
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: false,
                                    minorTicksPerInterval: 1,
                                    activeColor: Colors.pink,
                                    inactiveColor: Colors.pinkAccent.shade100,
                                    onChanged: (dynamic value) {},
                                  ),
                                  Text(
                                    "Relaxed",
                                    style: GoogleFonts.barlow(
                                      color: Colors.pinkAccent,
                                      fontSize: screenSize.height * 0.3 * 0.07,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Average heart rate over the whole day is ${avg.toInt()} BPM",
                          style: GoogleFonts.barlow(
                              fontSize: screenSize.width * 0.9 * 0.034,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: screenSize.width * 0.80,
                          height: screenSize.width * 0.32 * 0.55,
                          child: Sparkline(
                            data: mothersVitals,
                            useCubicSmoothing: true,
                            cubicSmoothingFactor: 0.1,
                            lineColor: Colors.pink,
                            lineWidth: 2.5,
                            fillMode: FillMode.below,
                            fillGradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.pinkAccent,
                                Colors.pinkAccent.shade200,
                                Colors.pinkAccent.shade100
                              ],
                            ),
                            averageLine: true,
                            averageLabel: false,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                Container(
                  height: screenSize.height * 0.25,
                  width: screenSize.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff1c1d21),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: screenSize.width * 0.9 * 0.5,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: screenSize.height * 0.23 * 0.09,
                              right: screenSize.height * 0.23 * 0.09,
                              top: screenSize.height * 0.23 * 0.09),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Stress",
                                style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontSize: screenSize.height * 0.3 * 0.09,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                date,
                                style: GoogleFonts.barlow(
                                  color: Colors.grey.shade600,
                                  fontSize: screenSize.height * 0.3 * 0.06,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RulerPicker(
                                controller: RulerPickerController(),
                                rulerBackgroundColor: Colors.transparent,
                                beginValue: 0,
                                endValue: 100,
                                initValue: _val,
                                scaleLineStyleList: [
                                  ScaleLineStyle(
                                      color: Colors.grey,
                                      width: 1.5,
                                      height: 30,
                                      scale: 0),
                                  ScaleLineStyle(
                                      color: Colors.grey,
                                      width: 1,
                                      height: 25,
                                      scale: 5),
                                  ScaleLineStyle(
                                      color: Colors.grey,
                                      width: 1,
                                      height: 15,
                                      scale: -1)
                                ],
                                onValueChange: (value) {
                                  setState(() {
                                    _val = value;
                                  });
                                },
                                width: screenSize.width * 0.9 * 0.4,
                                height: screenSize.height * 0.25 * 0.2,
                                rulerMarginTop: 8,
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$_val",
                                      style: GoogleFonts.barlow(
                                          fontSize:
                                              screenSize.height * 0.3 * 0.13,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Normal",
                                      style: GoogleFonts.barlow(
                                          fontSize:
                                              screenSize.height * 0.3 * 0.09,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: screenSize.width * 0.9 * 0.5,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: screenSize.height * 0.23 * 0.09,
                              right: screenSize.height * 0.23 * 0.09,
                              top: screenSize.height * 0.23 * 0.09),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sp0\u2082",
                                style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontSize: screenSize.height * 0.3 * 0.09,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                date,
                                style: GoogleFonts.barlow(
                                  color: Colors.grey.shade600,
                                  fontSize: screenSize.height * 0.3 * 0.06,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: screenSize.height * 0.25 * 0.57,
                                child: LiquidLinearProgressIndicator(
                                  value: 92 / 100,
                                  // Defaults to 0.5.
                                  valueColor: AlwaysStoppedAnimation(
                                      Colors.pink.shade400),
                                  // Defaults to the current Theme's accentColor.
                                  backgroundColor: Colors.transparent,
                                  // Defaults to the current Theme's backgroundColor.
                                  borderColor: Colors.transparent,
                                  borderWidth: 5.0,
                                  borderRadius: 8.0,
                                  direction: Axis.vertical,
                                  // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "92%",
                                        style: GoogleFonts.barlow(
                                            fontSize:
                                                screenSize.height * 0.3 * 0.13,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "Normal",
                                        style: GoogleFonts.barlow(
                                            fontSize:
                                                screenSize.height * 0.3 * 0.09,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                  height: screenSize.height * 0.11,
                  width: screenSize.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff1c1d21),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: screenSize.width * 0.9 * 0.5,
                        child: Center(
                          child: TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.white.withAlpha(80)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        side:
                                            BorderSide(color: Colors.white)))),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  " CALL ",
                                  style: GoogleFonts.barlow(
                                      fontSize: screenSize.height * 0.02,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  TablerIcons.ambulance,
                                  size: screenSize.width * 0.9 * 0.09,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            onPressed: () => launch("tel://102"),
                          ),
                        ),
                      ),
                      Container(
                        width: screenSize.width * 0.9 * 0.5,
                        child: Center(
                          child: TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.white.withAlpha(80)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        side:
                                            BorderSide(color: Colors.white)))),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  " FIND ",
                                  style: GoogleFonts.barlow(
                                      fontSize: screenSize.height * 0.02,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  TablerIcons.building_hospital,
                                  size: screenSize.width * 0.9 * 0.09,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            onPressed: () => launch(
                                "https://www.google.com/maps/place/Apollo+Speciality+Hospitals+Vanagaram/@13.0707104,80.1484316,17z/data=!3m1!4b1!4m5!3m4!1s0x3a52617b16c5b051:0xa67384e8a225f370!8m2!3d13.0707104!4d80.1506203"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
