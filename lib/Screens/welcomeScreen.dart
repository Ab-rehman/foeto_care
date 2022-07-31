import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  static const id = 'welcome_page';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Color(0xff1F1D2B),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/welcomescreenbg.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'images/foetocare.png',
                        height: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Hero(
                    tag: 'foetocare',
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        'Foeto Care',
                        style: GoogleFonts.bebasNeue(
                          fontSize: screenSize.width * 0.9 * 0.15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.06,
                  ),
                  Text(
                    'Every Beat Counts.',
                    style: GoogleFonts.roboto(
                      fontSize: screenSize.width * 0.9 * 0.07,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.08,
                  ),
                  Hero(
                    tag: 'login',
                    child: Container(
                      width: screenSize.width * 0.7,
                      height: screenSize.height * 0.09,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'logInScreen');
                        },
                        child: Text('Login',
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
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffFF4081)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
                  Hero(
                    tag: 'register',
                    child: Container(
                      width: screenSize.width * 0.7,
                      height: screenSize.height * 0.09,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signUpScreen');
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
                              side: BorderSide(color: Color(0xffFF4081),width: 3.0),

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
