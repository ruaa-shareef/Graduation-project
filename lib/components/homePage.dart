import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/classes/course.dart';

import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/components/takeStudents.dart';
import 'package:ppu_attendance/services/apiServices.dart';

class HomePage extends StatefulWidget {

  final int lecturerId;
  HomePage({Key? key,required this.lecturerId}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerPage(lecturerId: widget.lecturerId,),
      appBar: AppBar(
        title: Text(
          "PPU ATTENDANCE APP",
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
      body: FutureBuilder<List<Course>>(
        future: APIServices(lecturerId : widget.lecturerId).homeData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Course>? courses = snapshot.data;
            return ListView.builder(
              itemCount: courses!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TakeStudents(
                            lecturerId : widget.lecturerId,
                            course: courses[index],
                          ),
                        ),
                      );
                    },
                    leading: Container(
                        child: Text(
                      "C220",
                      style: TextStyle(
                        fontSize: 26,
                        color: Color(0xff622545),
                      ),
                    )),
                    title: Text(
                      courses[index].courseName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff707070),
                      ),
                    ),
                    subtitle: FutureBuilder<String>(
                        future: APIServices(
                                groupSectionId: courses[index].groupSectionId)
                            .courseTime,
                        builder: (context, snapshot) {
                          return Text(
                            "08:00 - 08:50",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          );
                        }),
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