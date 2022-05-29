import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/components/drawer.dart';

class ProfilePage extends StatefulWidget {

  final int lecturerId;
  
  ProfilePage({Key? key,required this.lecturerId}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff622545),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "PPU ATTENDANCE",
          style: GoogleFonts.roboto(
            color: Colors.white,
            // fontSize: 60,
          ),
          // style: GoogleFonts.lato(),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/ppu-logo-white.png",
          ),
        ),
        elevation: 0,
      ),
      endDrawer: DrawerPage(lecturerId:widget.lecturerId ),
      backgroundColor: Color(0xff622545),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 25, bottom: 25),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Text(
              "AAAA@ppu.edu.ps",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Center(
            child: Text(
              "عليان فواد عليان ابو غربية",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            height: 120,
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Courses",
                      style: GoogleFonts.roboto(
                        // color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "5",
                      style: GoogleFonts.roboto(
                        // color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Quizzez",
                      style: GoogleFonts.roboto(
                        // color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "5",
                      style: GoogleFonts.roboto(
                        // color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(),
          child: Text(
            "2022 @PPU",
            style: GoogleFonts.roboto(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}