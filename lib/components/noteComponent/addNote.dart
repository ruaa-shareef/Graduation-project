import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/classes/note.dart';
import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/services/noteServices.dart';

class AddNote extends StatefulWidget {
  final int lecturerId;
  AddNote({Key? key,required this.lecturerId}) : super(key: key);

  @override
  State<AddNote> createState() => TAddNoteState();
}

class TAddNoteState extends State<AddNote> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Take New Note",
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
          Container(
            width: double.infinity,
            height: 70,
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
                  "1-Jan-22",
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
                Container(
                  width: 140,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: TextFormField(
                    controller: nameController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    // controller: driverNameController,
                    cursorWidth: 1, cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "Note Name",
                      labelStyle: GoogleFonts.roboto(
                        fontSize: 16.0,
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
              ],
            ),
          ),
          //////////////////////////////
          SizedBox(height: 10),
          Container(
            // height: 500,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: bodyController,
              textAlign: TextAlign.left,
              minLines: 6,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "Note",
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
          SizedBox(height: 30),
          Center(
            child: Container(
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.check_circle_outline),
                label: Text("Save New Note"),
                onPressed: () async {
                  await NoteServices().createNote(new Note(
                    name: nameController.text,
                    body: bodyController.text,
                    lecturerId: widget.lecturerId,
                    day: DateTime.now()));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Your Note Added'),
                  ));
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }
}