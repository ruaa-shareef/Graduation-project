import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ppu_attendance/classes/course.dart';
import 'package:ppu_attendance/classes/quize.dart';
import 'package:ppu_attendance/classes/student.dart';
import 'package:ppu_attendance/classes/studentsQuize.dart';
import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/services/quizeServices.dart';
import 'package:ppu_attendance/services/studentsServices.dart';

class UpdateQuize extends StatefulWidget {
  final Course? course;
  final int lecturerId;
  final Quize? quize;

  UpdateQuize({Key? key, this.course,required this.lecturerId, this.quize}): super(key: key);

  @override
  State<UpdateQuize> createState() => TUpdateQuizeState();
}

class TUpdateQuizeState extends State<UpdateQuize> {
  int studentLength = 0;
  TextEditingController quizeNameController = TextEditingController();
  List<TextEditingController> studentMarkController = [];

  @override
  void initState() {
    super.initState();
    studentMarkController = [];
    for (var i = 0; i < widget.course!.capacity; i++) {
      studentMarkController.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update First Quize",
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
      body: FutureBuilder<Quize>(
          future: QuizeServices(quizeId: widget.quize!.id).quizeById,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Quize? quize = snapshot.data;
              quizeNameController.text = quize!.name;
              return ListView(
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
                          DateFormat.yMMMMd('en_US').format(widget.quize!.day),
                          style: TextStyle(
                            fontSize: 18,
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
                          widget.course!.courseName,
                          style: TextStyle(
                            fontSize: 26,
                            color: Color(0xff622545),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //////////////////////////////
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                      width: 200,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        controller: quizeNameController,
                        cursorWidth: 1,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                        labelText: "Quize Name",
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
              //////////////////////////////
              FutureBuilder<List<StudentsQuize>>(
                future: QuizeServices(quizeId: quize.id).studentsMark,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<StudentsQuize>? studentsMark = snapshot.data;
                    print("-------------------------");
                    studentLength = studentsMark!.length;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: studentsMark.length,
                      itemBuilder: (context, index) {
                        studentMarkController[index].text =
                        studentsMark[index].mark.toString();
                        return FutureBuilder<Student>(
                          future: StudentsServices(
                            studentId:
                            studentsMark[index].studentId).studentById,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                              Student? student = snapshot.data;
                              return Container(
                                height: 70,
                                alignment: Alignment.center,
                                child: Card(
                                  elevation: 0,
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: Text(
                                      student!.studentNo.toString(),
                                    ),
                                    title: Text(
                                    student.studentNameArabic),
                                    trailing: Container(
                                      width: 100,
                                      height: 50,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        keyboardType:
                                        TextInputType.number,
                                        controller:
                                          studentMarkController[index],
                                          cursorWidth: 1,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                            enabledBorder:OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                width: 1.0,
                                                color:Color(0xff622545),
                                              ),
                                            ),
                                            focusedBorder:OutlineInputBorder(
                                              borderRadius:BorderRadius.circular(5.0),
                                                borderSide: BorderSide(
                                                  width: 1.5,
                                                  color:Color(0xff622545),
                                                ),
                                                //Change color to Color(0xff73a16a)
                                            ),
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
                          });
                        } 
                        else {
                          return const CircularProgressIndicator();
                        }
                      }),
                  SizedBox(height: 30),
                  Center(
                    child: Container(
                      height: 50,
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.check_circle_outline),
                        label: Text("Save Update Quize"),
                        onPressed: () async {
                          await QuizeServices(quizeId: quize.id).updateQuize(new Quize(
                            id: quize.id,
                            sectionId: widget.course!.sectionNo,
                            lecturerId: widget.lecturerId,
                            courseId: widget.course!.courseNo!,
                            day: quize.day,
                            name: quizeNameController.text),
                          );
                          print("-----------------");

                          List<StudentsQuize>? studentsMark = await  QuizeServices(quizeId: quize.id).studentsMark;

                          List<Map<String, dynamic>> studentMarks = [];

                          for (var i = 0; i < studentsMark.length; i++) {
                            studentMarks.add(new StudentsQuize(
                              id: studentsMark[i].id,
                              studentId: studentsMark[i].studentId,
                              quizeId: quize.id!,
                              mark: int.parse(studentMarkController[i].text),
                            ).toJson());
                          }

                          await QuizeServices().updateQuizeStudents(studentMarks);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Color(0xff622545),
                            content:
                              Text('${quizeNameController.text} Quize Updated!'),
                          ));
                          Navigator.of(context).pop();
                          // List<Attendance> attendances = [];
                          // for (bool item in attendancelist) {}
                          // print(studentLength);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30)
                ],
              );
            } 
            else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}