import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/classes/attendance.dart';
import 'package:ppu_attendance/classes/attendanceStudents.dart';
import 'package:ppu_attendance/classes/course.dart';
import 'package:ppu_attendance/classes/student.dart';
import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/services/attendanceServises.dart';
import 'package:ppu_attendance/services/studentsServices.dart';
import 'package:intl/intl.dart';

class TakeStudents extends StatefulWidget {
  final Course? course;
  final int lecturerId;
  TakeStudents({Key? key, this.course, required this.lecturerId})
    : super(key: key);

  @override
  State<TakeStudents> createState() => TtakeStudentsState();
}

class TtakeStudentsState extends State<TakeStudents> {
  bool value = false;
  DateTime now = new DateTime.now();
  List<bool> attendancelist = [];
  int studentLength = 0;

  var days = [
    {1: 'Sunday'},
    {2: 'Monday'},
    {3: 'Tuesday'},
    {4: 'Wednesday'},
    {5: 'Thuersday'},
    {6: 'Friday'},
    {7: 'Saturday'},
  ];

  List<Student>? students;
  @override
  void initState() {
    super.initState();
    // attendancelist = List.filled(widget.course!.capacity, false);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.course?.capacity);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Students Attendance",
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
      endDrawer: DrawerPage(lecturerId: widget.lecturerId),
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
                  DateFormat.yMMMMd('en_US').format(now),
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
                  widget.course?.courseName ?? "",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff622545),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<List<Student>>(
            future: StudentsServices(
              courseNo: widget.course?.courseNo,
              sectionNo: widget.course?.sectionNo).students,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Student>? students = snapshot.data;
                 for (var i = 0; i <students!.length; i++) {
                    attendancelist.add(false);
                  }
                print("-------------------------");
                studentLength = students.length;
                print(students.length.toString());
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: Card(
                        elevation: 0,
                        child: CheckboxListTile(
                          secondary: Text(
                            students[index].studentNo.toString(),
                            style: GoogleFonts.roboto(
                              fontSize: 14.0,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          title: Text(
                            students[index].studentNameArabic,
                            style: GoogleFonts.roboto(
                              fontSize: 18.0,
                              color: Color(0xff622545),
                            ),
                          ),
                          value: this.attendancelist[index],
                          onChanged: (value) => setState(
                            () => {
                              attendancelist[index] = value!,
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          SizedBox(height: 30),
          Center(
            child: Container(
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.check_circle_outline),
                label: Text("Done"),
                onPressed: () async {
                  int? attendanceId =
                      await AttendanceServices().createAttendance(
                    new Attendance(
                      sectionId: widget.course!.sectionNo,
                      lecturerId: widget.lecturerId,
                      courseId: widget.course!.courseNo!,
                      day: DateTime.now(),
                      attendanceDone: true,
                    ),
                  );
                  print("-----------------");
                  print(attendanceId);

                  students = await StudentsServices(
                    courseNo: widget.course?.courseNo,
                    sectionNo: widget.course?.sectionNo).students;

                  List<Map<String, dynamic>> attendanceStudent = [];

                  for (var i = 0; i < students!.length; i++) {
                    attendanceStudent.add(new AttendanceStudents(
                      studentId: students![i].studentNo,
                      attendanceId: attendanceId!,
                      absence: attendancelist[i],
                    ).toJson());
                  }

                  await AttendanceServices()
                    .createAttendanceStudents(attendanceStudent);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Attendance Added'),
                  ));
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}