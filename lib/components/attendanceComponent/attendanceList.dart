import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ppu_attendance/classes/attendance.dart';
import 'package:ppu_attendance/classes/course.dart';
import 'package:ppu_attendance/components/attendanceComponent/studentsAttendance.dart';
import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/services/attendanceServises.dart';

class AttendanceList extends StatefulWidget {
  final Course? course;
  final int lecturerId;

  AttendanceList({Key? key, this.course,required this.lecturerId}) : super(key: key);

  @override
  State<AttendanceList> createState() => TAttendanceListState();
}

class TAttendanceListState extends State<AttendanceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.course!.courseName} Attendance List",
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
      body: FutureBuilder<List<Attendance>>(
        future: AttendanceServices(
          courseNo: widget.course!.courseNo,
          lecturerId: widget.lecturerId,
          sectionNo: widget.course!.sectionNo).attendances,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Attendance>? attendanceList = snapshot.data;
              return ListView.builder(
                itemCount: attendanceList?.length,
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
                              builder: (context) => StudentsAttendance(
                                course: widget.course,
                                attendance: attendanceList?[index],
                                lecturerId: widget.lecturerId,
                              ),
                            ),
                          );
                        },
                        leading: Text('1'),
                        title: Text(
                          DateFormat.yMMMMd('en_US').format(attendanceList![index].day),
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
                            color: Color(0xff622545),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } 
            else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
