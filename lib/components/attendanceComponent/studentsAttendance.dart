import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/classes/attendance.dart';
import 'package:ppu_attendance/classes/attendanceStudents.dart';
import 'package:ppu_attendance/classes/course.dart';
import 'package:ppu_attendance/classes/student.dart';
import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/services/attendanceServises.dart';
import 'package:ppu_attendance/services/studentsServices.dart';

class StudentsAttendance extends StatefulWidget {
  final Attendance? attendance;
  final Course? course;
  final int lecturerId;
  StudentsAttendance({Key? key, this.attendance, this.course,required this.lecturerId})
      : super(key: key);

  @override
  State<StudentsAttendance> createState() => TStudentsAttendanceState();
}

class TStudentsAttendanceState extends State<StudentsAttendance> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter / Attendance",
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
          FutureBuilder<List<AttendanceStudents>>(
            future: AttendanceServices(attendanceId: widget.attendance!.id).attendanceStudent,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<AttendanceStudents>? studentsList = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: studentsList!.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder<Student>(
                      future: StudentsServices(
                      studentId: studentsList[index].studentId).studentById,
                        builder: (context, snapshot) {
                          Student? student = snapshot.data;
                          if (snapshot.hasData) {
                            return Container(
                              height: 70,
                              alignment: Alignment.center,
                              child: Card(
                                elevation: 0,
                                child: ListTile(
                                  leading: Text(
                                    student!.studentNo.toString(),
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  title: Text(
                                    student.studentNameArabic,
                                    style: GoogleFonts.roboto(
                                      fontSize: 18.0,
                                      color: Color(0xff622545),
                                    ),
                                  ),
                                  trailing: Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.grey.shade50,
                                    alignment: Alignment.center,
                                    child: Text(
                                      studentsList[index].absence.toString(),
                                      style: GoogleFonts.roboto(
                                        fontSize: 14.0,
                                        color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } 
                          else {
                            return const CircularProgressIndicator();
                          }
                        });
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}