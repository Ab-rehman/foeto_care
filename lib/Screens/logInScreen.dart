import 'package:flutter/material.dart';
import 'package:foeto_care/creds.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController email = new TextEditingController();
TextEditingController pass = new TextEditingController();

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

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
                    "Welcome Back!",
                    style: GoogleFonts.roboto(
                      fontSize: screenSize.width * 0.9 * 0.08,
                      color: Color(0xffFF4081),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  Text(
                    "Email",
                    style: GoogleFonts.montserrat(
                      fontSize: screenSize.width * 0.9 * 0.06,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: UnderlineInputBorder(
                        //borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFF4081), width: 1.0),
                        //borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFF4081), width: 2.0),
                        //borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "Password",
                    style: GoogleFonts.montserrat(
                      fontSize: screenSize.width * 0.9 * 0.06,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter your Password',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: UnderlineInputBorder(
                        //borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFF4081), width: 1.0),
                        //borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFF4081), width: 2.0),
                        //borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Center(
                    child: Hero(
                      tag: 'login',
                      child: Container(
                        width: screenSize.width * 0.7,
                        height: screenSize.height * 0.09,
                        child: ElevatedButton(
                          onPressed: () {
                            doctorsList.forEach((doctor) {
                              if(doctor.email == email.value.text && doctor.password == pass.value.text) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                email.clear();
                                pass.clear();
                                Navigator.pushNamedAndRemoveUntil(context, 'doctorScreen',ModalRoute.withName('welcomeScreen'));
                              }
                            });
                            usersList.forEach((user) {
                              if(user.email == email.value.text && user.password == pass.value.text) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                email.clear();
                                pass.clear();
                                Navigator.pushNamedAndRemoveUntil(context, 'initialiseValuesScreen',ModalRoute.withName('welcomeScreen'));
                              }
                            });

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
