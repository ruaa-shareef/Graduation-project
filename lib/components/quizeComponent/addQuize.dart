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

class AddQuize extends StatefulWidget {
  final Course? course;
  final int lecturerId;

  AddQuize({
    Key? key,
    this.course,
    required this.lecturerId,
  }) : super(key: key);

  @override
  State<AddQuize> createState() => TAddQuizeState();
}

class TAddQuizeState extends State<AddQuize> {
  int studentLength = 0;
  TextEditingController quizeNameController = TextEditingController();
  List<TextEditingController> studentMarkController = [];
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // studentMarkController = [];
    // for (var i = 0; i < widget.course!.capacity; i++) {
    //   studentMarkController.add(TextEditingController());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Take New Quize",
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
      endDrawer: DrawerPage(
        lecturerId: widget.lecturerId,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
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
                    DateFormat.yMMMMd('en_US').format(DateTime.now()),
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
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
            FutureBuilder<List<Student>>(
              future: StudentsServices(
                courseNo: widget.course?.courseNo,
                sectionNo: widget.course?.sectionNo,
              ).students,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Student>? students = snapshot.data;
                  for (var i = 0; i <students!.length; i++) {
                    studentMarkController.add(TextEditingController());
                  }
                  print("-------------------------");
                  studentLength = students.length;
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
                          color: Colors.white,
                          child: ListTile(
                          leading: Text(
                          students[index].studentNo.toString(),
                        ),
                        title: Text(students[index].studentNameArabic),
                       trailing: Container(
                          width: 100,
                          height: 50,
                         child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            controller: studentMarkController[index],
                            cursorWidth: 1,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: Color(0xff622545),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color(0xff622545),
                                ),
                                //Change color to Color(0xff73a16a)
                              ),
                            ),
                          ),
                        ),
                        ),
                      ),
                      );
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
                  label: Text("Save New Quize"),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      int? quizeId = await QuizeServices().createQuize(
                        new Quize(
                          sectionId: widget.course!.sectionNo,
                          lecturerId: widget.lecturerId,
                          courseId: widget.course!.courseNo!,
                          day: DateTime.now(),
                          name: quizeNameController.text),
                        );
                      print("-----------------");
                      print(quizeId);
                      List<Student>? students = await StudentsServices(
                        courseNo: widget.course?.courseNo,
                        sectionNo: widget.course?.sectionNo).students;
                      List<Map<String, dynamic>> studentMarks = [];
                      for (var i = 0; i < students.length; i++) {
                        studentMarks.add(new StudentsQuize(
                          studentId: students[i].studentNo,
                          quizeId: quizeId!,
                          mark: int.parse(studentMarkController[i].text),
                        ).toJson());
                      }
                      await QuizeServices().createQuizeStudents(studentMarks);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                          Text('${quizeNameController.text} Quize Added'),
                      ));
                      Navigator.of(context).pop();
                      // List<Attendance> attendances = [];
                      // for (bool item in attendancelist) {}
                      // print(studentLength);
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}