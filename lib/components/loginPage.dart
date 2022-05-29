import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/classes/lecturer.dart';
import 'package:ppu_attendance/components/homePage.dart';
import 'package:ppu_attendance/services/apiServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController superNoController = TextEditingController();

  var _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: deviceHeight * 0.30,
                margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: Center(
                  child: FittedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset('assets/PPU-logo1.png'),
                      radius: 120,
                    ),
                  ),
                ),
              ),
              Container(
                height: deviceHeight * 0.65,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(
                  builder: (ctx, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'login',
                          style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.08,
                        ),
                        Container(
                          height: constraints.maxHeight * 0.12,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Center(
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.text,
                                controller: nameController,
                                cursorWidth: 1,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Supervisor Name AR",
                                  labelStyle: GoogleFonts.roboto(
                                    fontSize: 18.0,
                                    color: Color(0xff622545),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Color(0xff622545),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      width: 1.5,
                                      color: Color(0xff622545),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        Container(
                          height: constraints.maxHeight * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Center(
                              child: TextFormField(
                                controller: superNoController,
                                cursorWidth: 1,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                obscureText: _isVisible ? false : true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  labelText: "Supervisor Number",
                                  labelStyle: GoogleFonts.roboto(
                                    fontSize: 18.0,
                                    color: Color(0xff622545),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Color(0xff622545),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      width: 1.5,
                                      color: Color(0xff622545),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: constraints.maxHeight * 0.12,
                          margin: EdgeInsets.only(
                            top: constraints.maxHeight * 0.05,
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              bool result = await APIServices().login(
                                new Lecturer(
                                  supervisorNo:
                                    int.parse(superNoController.text),
                                  supervisorArabicName: nameController.text,
                                ),
                              );

                              if (result) {
                                // Obtain shared preferences.
                                final prefs = await SharedPreferences.getInstance();

                                await prefs.setInt('supervisorNo',
                                  int.parse(superNoController.text));
                                await prefs.setString('supervisorArabicName',
                                  nameController.text);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(
                                    lecturerId: int.parse(
                                    superNoController.text),
                                  )),
                                );
                              } 
                              else {
                                nameController.text = "";
                                superNoController.text = "";
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: Colors.red.shade600,
                                  content: Text(
                                    'Your Name OR Supervisor Number Incorrect'),
                                ));
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}