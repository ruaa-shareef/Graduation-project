import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/classes/course.dart';
import 'package:ppu_attendance/components/attendanceComponent/attendanceList.dart';
import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/services/apiServices.dart';

class AllCoursesAttendance extends StatefulWidget {
  final int lecturerId;
  AllCoursesAttendance({Key? key,required this.lecturerId}) : super(key: key);

  @override
  State<AllCoursesAttendance> createState() => TAllCoursesAttendanceState();
}

class TAllCoursesAttendanceState extends State<AllCoursesAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Courses Attendance",
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
      body: FutureBuilder<List<Course>>(
        future: APIServices(lecturerId: widget.lecturerId).homeData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Course>? courses = snapshot.data;
            return ListView.builder(
              itemCount: courses!.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 70,
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 0,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AttendanceList(
                            course: courses[index],
                            lecturerId: widget.lecturerId,
                          )),
                        );
                      },
                      leading: Icon(Icons.insert_drive_file_rounded),
                      title: Text(
                        courses[index].courseName,
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      subtitle: Text("Section : ${courses[index].sectionNo}"),
                      trailing: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          "Student :${courses[index].capacity}",
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } 
          else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}