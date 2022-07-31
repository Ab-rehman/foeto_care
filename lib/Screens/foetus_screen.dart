import 'dart:async';
import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:foeto_care/Screens/initialiseValuesScreen.dart';
import 'package:foeto_care/Services/foetusVitalsJson.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FoetusScreen extends StatefulWidget {
  const FoetusScreen({Key? key}) : super(key: key);

  @override
  State<FoetusScreen> createState() => _FoetusScreenState();
}

FoetusVitals foetusVitalsClassObject = FoetusVitals();
Timer? timer, timer1;
List<double> data = [28, 30, 12, 50, 2];
String date = foetusTimeStamp.elementAt(foetusTimeStamp.length - 1);
double val = foetusVitals.elementAt(foetusVitals.length - 1);
double avg =
    foetusVitals.map((m) => m).reduce((a, b) => a + b) / foetusVitals.length;

class _FoetusScreenState extends State<FoetusScreen> {
  final controller = PageController();

  updateData(Timer timer) {
    setState(() {
      val = foetusVitals.elementAt(foetusVitals.length - 1);
      avg = foetusVitals.map((m) => m).reduce((a, b) => a + b) /
          foetusVitals.length;
      date = foetusTimeStamp.elementAt(foetusTimeStamp.length - 1);
    });
  }

  updateDataSource(Timer timer) async {
    var len = foetusVitals.length;
    // foetusVitals = await foetusVitalsClassObject.getFoetusVitals();
    // foetusTimeStamp = await foetusVitalsClassObject.getTimeStamp();
    var temp = Random().nextInt(10)+160;
    foetusVitals.add(double.parse(temp.toString()));
    var newlen = foetusVitals.length;
    for (; len < newlen; len++) foetusVitals.removeAt(0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff101110),
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
        child: Center(
          child: Column(
            children: [
              // Container(
              //   height: screenSize.height * 0.3893,
              // ),
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
                          data: foetusVitals,
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
              // SizedBox(
              //   height: screenSize.height * 0.05,
              // ),
              Container(
                height: screenSize.height * 0.3893,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.3893 * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      height: screenSize.height * 0.3893 * 0.2,
                      width: screenSize.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff1c1d21),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Resting heart rate",
                            style: GoogleFonts.barlow(
                                fontSize: screenSize.height * 0.9 * 0.023,
                                color: Colors.white),
                          ),
                          Text(
                            "150 BPM",
                            style: GoogleFonts.barlow(
                                fontSize: screenSize.height * 0.9 * 0.018,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.3893 * 0.05,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      height: screenSize.height * 0.3893 * 0.4,
                      width: screenSize.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff1c1d21),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Daily statistics",
                            style: GoogleFonts.barlow(
                                fontSize: screenSize.height * 0.9 * 0.03,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Avg heart rate",
                                style: GoogleFonts.barlow(
                                    fontSize: screenSize.height * 0.9 * 0.022,
                                    color: Colors.white),
                              ),
                              Text(
                                "${avg.toInt()} BPM",
                                style: GoogleFonts.barlow(
                                    fontSize: screenSize.height * 0.9 * 0.018,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Max heart rate",
                                style: GoogleFonts.barlow(
                                    fontSize: screenSize.height * 0.9 * 0.022,
                                    color: Colors.white),
                              ),
                              Text(
                                "${foetusVitals.reduce(max)} BPM",
                                style: GoogleFonts.barlow(
                                    fontSize: screenSize.height * 0.9 * 0.018,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Minimum heart rate",
                                style: GoogleFonts.barlow(
                                    fontSize: screenSize.height * 0.9 * 0.022,
                                    color: Colors.white),
                              ),
                              Text(
                                "${foetusVitals.reduce(min)} BPM",
                                style: GoogleFonts.barlow(
                                    fontSize: screenSize.height * 0.9 * 0.018,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.3893 * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      height: screenSize.height * 0.3893 * 0.2,
                      width: screenSize.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff1c1d21),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Manually measured results",
                            style: GoogleFonts.barlow(
                                fontSize: screenSize.height * 0.9 * 0.023,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: screenSize.height * 0.38 * 0.05,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
