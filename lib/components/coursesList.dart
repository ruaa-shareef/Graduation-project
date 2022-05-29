import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/classes/course.dart';
import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/services/apiServices.dart';

class CoursesList extends StatefulWidget {
  final int lecturerId;
  CoursesList({Key? key, required this.lecturerId}) : super(key: key);

  @override
  State<CoursesList> createState() => TCoursesListState();
}

class TCoursesListState extends State<CoursesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Courses List",
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
      body: FutureBuilder<List<Course>>(
        future: APIServices(lecturerId: widget.lecturerId).homeData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Course>? courses = snapshot.data;
            return ListView.builder(
              itemCount: courses!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 0,
                    child: ListTile(
                      leading: Icon(Icons.hotel_class),
                      title: Text(
                        courses[index].courseName,
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Color(0xff622545),
                        ),
                      ),
                      subtitle: Text("Sunday / Tuesday / Thuersday"),
                      trailing: Column(
                        children: [
                          Text(
                            "C220",
                            style: GoogleFonts.roboto(
                              fontSize: 16.0,
                              color: Color(0xff622545),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "80:00",
                            style: GoogleFonts.roboto(
                              color: Color(0xff622545),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}