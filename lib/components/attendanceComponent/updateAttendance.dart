import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/components/drawer.dart';

class UpdateAttendance extends StatefulWidget {
  final int lecturerId;
  UpdateAttendance({Key? key,required this.lecturerId}) : super(key: key);

  @override
  State<UpdateAttendance> createState() => TUpdateAttendanceState();
}

class TUpdateAttendanceState extends State<UpdateAttendance> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Students Attendance",
          style: GoogleFonts.roboto(
            // fontSize: 60,
          ),
          // style: GoogleFonts.lato(),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/ppu-logo.png",
          ),
        ),
      ),
      endDrawer: DrawerPage(lecturerId: widget.lecturerId,),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "1-Jan-22",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff622545),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                Text(
                  "Flutter",
                  style: TextStyle(
                    fontSize: 26,
                    color: Color(0xff622545),
                  ),
                ),
              ],
            ),
          ),
          ///////////////////////////////
          ///
          ///
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              child: ListTile(
                leading: Text(
                  '1',
                  style: GoogleFonts.roboto(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                title: Text(
                  "Assel",
                  style: GoogleFonts.roboto(
                    fontSize: 18.0,
                    color: Color(0xff622545),
                  ),
                ),
                trailing: Checkbox(
                  value: this.value,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
              ),
            ),
          ),

          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              child: ListTile(
                leading: Text(
                  '1',
                  style: GoogleFonts.roboto(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                title: Text(
                  "Assel",
                  style: GoogleFonts.roboto(
                    fontSize: 18.0,
                    color: Color(0xff622545),
                  ),
                ),
                trailing: Checkbox(
                  value: this.value,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              child: ListTile(
                leading: Text(
                  '1',
                  style: GoogleFonts.roboto(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                title: Text(
                  "Assel",
                  style: GoogleFonts.roboto(
                    fontSize: 18.0,
                    color: Color(0xff622545),
                  ),
                ),
                trailing: Checkbox(
                  value: this.value,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              child: ListTile(
                leading: Text(
                  '1',
                  style: GoogleFonts.roboto(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                title: Text(
                  "Assel",
                  style: GoogleFonts.roboto(
                    fontSize: 18.0,
                    color: Color(0xff622545),
                  ),
                ),
                trailing: Checkbox(
                  value: this.value,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              child: ListTile(
                leading: Text(
                  '1',
                  style: GoogleFonts.roboto(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                title: Text(
                  "Assel",
                  style: GoogleFonts.roboto(
                    fontSize: 18.0,
                    color: Color(0xff622545),
                  ),
                ),
                trailing: Checkbox(
                  value: this.value,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Container(
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.check_circle_outline),
                label: Text("Save Update"),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}