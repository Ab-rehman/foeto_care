import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class FoetusScreen extends StatefulWidget {
  const FoetusScreen({Key? key}) : super(key: key);

  @override
  State<FoetusScreen> createState() => _FoetusScreenState();
}

class _FoetusScreenState extends State<FoetusScreen> {
  final controller = PageController();

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
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.3893,
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
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
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
                              "160 BPM",
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
                              "170 BPM",
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
                              "150 BPM",
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
                        
                        Icon(Icons.arrow_forward_ios,color: Colors.white,size: screenSize.height*0.38*0.05,)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
