import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/components/attendanceComponent/allCoursesAttendance.dart';
import 'package:ppu_attendance/components/coursesList.dart';
import 'package:ppu_attendance/components/homePage.dart';
import 'package:ppu_attendance/components/noteComponent/noteList.dart';
import 'package:ppu_attendance/components/profilePage.dart';
import 'package:ppu_attendance/components/quizeComponent/allCoursesQuizzes.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerPage extends StatelessWidget {
  final int lecturerId;
  DrawerPage({required this.lecturerId});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xff622545)),
              accountName: Text(
                "Pinkesh Darji",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "pinkesh.earth@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
              arrowColor: Color(0xff622545),
              onDetailsPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                    lecturerId: lecturerId,
                  )),
                );
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Home Page',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff622545),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(lecturerId: lecturerId,)),
                );
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Courses',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff622545),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoursesList(
                      lecturerId: lecturerId,
                    )),
                );
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Attendance',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff622545),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllCoursesAttendance(
                      lecturerId: lecturerId,
                  )),
                );
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Quizzes',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff622545),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllCoursesQuizzez(
                      lecturerId: lecturerId,
                    )),
                );
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                'My Note',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff622545),
                ),
              )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteList(
                      lecturerId: lecturerId,
                  )),
                );
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                'Send Email',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff622545),
                ),
              )),
              onTap: () {
                if (Platform.isAndroid) {
                  AndroidIntent intent = AndroidIntent(
                    action: 'android.intent.action.MAIN',
                    category: 'android.intent.category.APP_EMAIL',
                  );
                  intent.launch().catchError((e) {
                    
                  });
                } else if (Platform.isIOS) {
                  // ignore: deprecated_member_use
                  launch("message://").catchError((e) {
                    
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}