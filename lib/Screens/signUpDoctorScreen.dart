import 'package:flutter/material.dart';
import 'package:foeto_care/Widgets/doctorScreenSignUpTextField.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foeto_care/Widgets/motherScreenSignUpTextField.dart';

class SignUpDoctorScreen extends StatelessWidget {
  const SignUpDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1F1D2B),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/welcomescreenbg.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(35.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    "Sign Up!",
                    style: GoogleFonts.roboto(
                      fontSize: screenSize.width * 0.9 * 0.08,
                      color: Color(0xff03a696),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.07,
                  ),
                  getDoctorScreenSignUpTextField("Name"),
                  SizedBox(height: 20.0,),
                  getDoctorScreenSignUpTextField("Phone Number"),
                  SizedBox(height: 20.0,),
                  getDoctorScreenSignUpTextField("Email"),
                  SizedBox(height: 20.0,),
                  getDoctorScreenSignUpTextField("Password"),
                  SizedBox(height: 20.0,),
                  getDoctorScreenSignUpTextField("Location"),
                  SizedBox(height: 20.0,),
                  Center(
                    child: Text("By Signing you agree to our",style: GoogleFonts.montserrat(
                      fontSize: screenSize.width * 0.9 * 0.04,
                      color: Colors.grey,
                    ),),
                  ),
                  SizedBox(height: 5.0,),
                  Center(
                    child: Text("terms of use and privacy policy",style: GoogleFonts.montserrat(
                      fontSize: screenSize.width * 0.9 * 0.04,
                      color: Colors.grey,
                    ),),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Center(
                    child: Container(
                      width: screenSize.width * 0.7,
                      height: screenSize.height * 0.09,
                      child: ElevatedButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.pushNamedAndRemoveUntil(context, 'doctorScreen', ModalRoute.withName('welcomeScreen'));
                        },
                        child: Text('Register',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: screenSize.width * 0.9 * 0.065,
                              color: Colors.white,
                            )),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(color: Color(0xff03a696),width: 3.0),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
