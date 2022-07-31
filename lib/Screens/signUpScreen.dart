import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool isButtonDisabled = true;
bool isDoctorPressed = false;
bool isMotherPressed = false;
Color buttonColor = Colors.grey.withOpacity(0.5);

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isButtonDisabled = true;
    isDoctorPressed = false;
    isMotherPressed = false;
    buttonColor = Colors.grey.withOpacity(0.5);
  }

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
          padding: EdgeInsets.all(35.0),
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
                "Create Your Account!",
                style: GoogleFonts.roboto(
                  fontSize: screenSize.width * 0.9 * 0.08,
                  color: Color(0xffFF4081),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.4,
                        width: MediaQuery.of(context).size.width * 0.32,
                        decoration: BoxDecoration(
                          color: isMotherPressed
                              ? Color(0xffFF4081)
                              : Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                          border: Border.all(
                            width: 3,
                            color: Color(0xffFF4081),
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: InkWell(
                          onTap: isDoctorPressed
                              ? () {
                                  setState(() {
                                    isDoctorPressed = false;
                                    isMotherPressed = true;
                                    isButtonDisabled = false;
                                    buttonColor = Color(0xffFF4081);
                                  });
                                }
                              : () {
                                  setState(() {
                                    isMotherPressed = true;
                                    isButtonDisabled = false;
                                    buttonColor = Color(0xffFF4081);
                                  });
                                },
                          child: Image.asset(
                            'images/mother.png',
                            width: MediaQuery.of(context).size.width * 0.25,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Mother",
                        style: GoogleFonts.montserrat(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Text(
                    "OR",
                    style: GoogleFonts.montserrat(
                        fontSize: MediaQuery.of(context).size.height * 0.035,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.4,
                        width: MediaQuery.of(context).size.width * 0.32,
                        decoration: BoxDecoration(
                          color: isDoctorPressed
                              ? Color(0xffFF4081)
                              : Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                          border: Border.all(
                            width: 3,
                            color: Color(0xffFF4081),
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: InkWell(
                          onTap: isMotherPressed
                              ? () {
                                  setState(() {
                                    isMotherPressed = false;
                                    isDoctorPressed = true;
                                    isButtonDisabled = false;
                                    buttonColor = Color(0xffFF4081);
                                  });
                                }
                              : () {
                                  setState(() {
                                    isDoctorPressed = true;
                                    isButtonDisabled = false;
                                    buttonColor = Color(0xffFF4081);
                                  });
                                },
                          child: Image.asset(
                            'images/doctor.png',
                            width: MediaQuery.of(context).size.width * 0.25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Doctor",
                        style: GoogleFonts.montserrat(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
              Center(
                child: Hero(
                  tag: 'signup',
                  child: Container(
                    width: screenSize.width * 0.7,
                    height: screenSize.height * 0.09,
                    child: ElevatedButton(
                      onPressed: isButtonDisabled
                          ? null
                          : () {
                              if (isMotherPressed) {
                                isButtonDisabled = true;
                                isDoctorPressed = false;
                                isMotherPressed = false;
                                buttonColor = Colors.grey.withOpacity(0.5);
                                Navigator.pushNamed(
                                    context, 'signUpMotherScreen');
                              } else if (isDoctorPressed) {
                                isButtonDisabled = true;
                                isDoctorPressed = false;
                                isMotherPressed = false;
                                buttonColor = Colors.grey.withOpacity(0.5);
                                Navigator.pushNamed(
                                    context, 'signUpDoctorScreen');
                              }
                            },
                      child: Text('Sign Up',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.width * 0.9 * 0.065,
                            color: Colors.white,
                          )),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(buttonColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
