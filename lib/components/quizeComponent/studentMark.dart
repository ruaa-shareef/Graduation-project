import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/classes/course.dart';
import 'package:ppu_attendance/classes/quize.dart';
import 'package:ppu_attendance/classes/student.dart';
import 'package:ppu_attendance/classes/studentsQuize.dart';
import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/components/quizeComponent/updateQuize.dart';
import 'package:ppu_attendance/services/quizeServices.dart';
import 'package:ppu_attendance/services/studentsServices.dart';

class StudentsMarks extends StatefulWidget {
  final Quize? quize;
  final Course? course;
  final int lecturerId;
  StudentsMarks({Key? key, this.quize, this.course,required this.lecturerId}) : super(key: key);

  @override
  State<StudentsMarks> createState() => TStudentsMarksState();
}

class TStudentsMarksState extends State<StudentsMarks> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.course!.courseName} / ${widget.quize!.name}",
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
          FutureBuilder<List<StudentsQuize>>(
            future: QuizeServices(quizeId: widget.quize!.id).studentsMark,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<StudentsQuize>? studentsMark = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: studentsMark!.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder<Student>(
                      future: StudentsServices(
                      studentId: studentsMark[index].studentId).studentById,
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
                                      studentsMark[index].mark.toString(),
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
                    }
                  );
                } 
                else {
                  return const CircularProgressIndicator();
                }
              }),
          SizedBox(height: 80),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateQuize(
                quize: widget.quize,
                course: widget.course,
                lecturerId: widget.quize!.lecturerId,
              )),
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}