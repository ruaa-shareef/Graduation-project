import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/classes/course.dart';
import 'package:ppu_attendance/classes/quize.dart';
import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/components/quizeComponent/addQuize.dart';
import 'package:ppu_attendance/components/quizeComponent/studentMark.dart';
import 'package:ppu_attendance/services/quizeServices.dart';

class QuizeList extends StatefulWidget {
  final Course? course;
  final int lecturerId;

  QuizeList({Key? key, this.course,required this.lecturerId}) : super(key: key);

  @override
  State<QuizeList> createState() => TQuizeListState();
}

class TQuizeListState extends State<QuizeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.course!.courseName} Quizzes",
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
      body: FutureBuilder<List<Quize>>(
        future: QuizeServices(
          courseNo: widget.course!.courseNo,
          sectionNo: widget.course!.sectionNo,
          lecturerId: widget.lecturerId).quizzes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Quize>? quizzes = snapshot.data;
              return ListView.builder(
                itemCount: quizzes?.length,
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
                              builder: (context) => StudentsMarks(
                                course: widget.course,
                                quize: quizzes?[index],
                                lecturerId: widget.lecturerId,
                              ),
                            ),
                          );
                        },
                        leading: Text('1'),
                        title: Text(
                          quizzes![index].name,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddQuize(
                  course: widget.course,
                  lecturerId: widget.lecturerId,
                )
              ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}