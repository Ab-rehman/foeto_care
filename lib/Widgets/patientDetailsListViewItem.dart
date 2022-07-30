import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

getPatientDetailsListViewItem(BuildContext context,String patientName,double childBPM,double motherBPM) {
  return Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        border: Border.all(
            color: Color(0xffFF4081),
            width: 5.0
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'images/foetocare.png',
          height: MediaQuery.of(context).size.width * 0.23,
        ),
        SizedBox(
          width: 15.0,
        ),
        Column(
          children: [
            Text(
              patientName,
              style: GoogleFonts.montserrat(
                fontSize: MediaQuery.of(context).size.width * 0.9 * 0.1,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.pregnant_woman,
                      color: Color(0xffFF4081),
                    ),
                    Text(
                      "${motherBPM.toInt()} BPM",
                      style: GoogleFonts.montserrat(
                        fontSize: MediaQuery.of(context).size.width * 0.9 * 0.03,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.child_care,
                      color: Color(0xffFF4081),
                    ),
                    Text(
                      " ${childBPM.toInt()} BPM",
                      style: GoogleFonts.montserrat(
                        fontSize: MediaQuery.of(context).size.width * 0.9 * 0.03,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}