import 'package:flutter/material.dart';
import 'package:foeto_care/Widgets/patientDetailsListViewItem.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1F1D2B),
      body: Container(
        width: screenSize.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/welcomescreenbg.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(35.0, 70.0, 35.0, 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FOETO-CARE",
                style: GoogleFonts.bebasNeue(
                  fontSize: screenSize.width * 0.9 * 0.12,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "Patient Dashboard",
                style: GoogleFonts.roboto(
                  fontSize: screenSize.width * 0.9 * 0.08,
                  color: Color(0xffFF4081),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  getPatientDetailsListViewItem(context, "Jane Doe", 152, 98),
                  SizedBox(height:30.0),
                  getPatientDetailsListViewItem(context, "Sara", 148, 94),
                  SizedBox(height:30.0),
                  getPatientDetailsListViewItem(context, "Riya", 151, 99),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
