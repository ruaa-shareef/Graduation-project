import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppu_attendance/classes/note.dart';
import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/services/noteServices.dart';

class UpdateNote extends StatefulWidget {
  final int? noteId;
  final int lecturerId;
  UpdateNote({Key? key, this.noteId,required this.lecturerId}) : super(key: key);

  @override
  State<UpdateNote> createState() => TUpdateNoteState();
}

class TUpdateNoteState extends State<UpdateNote> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Note",
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
      body: FutureBuilder<Note>(
          future: NoteServices(noteId: widget.noteId,lecturerId: widget.lecturerId).noteById,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Note? note = snapshot.data;
              nameController.text = note!.name;
              bodyController.text = note.body;
              return ListView(
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
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            controller: nameController,
                            cursorWidth: 1,
                            cursorColor: Colors.black,
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
                      cursorWidth: 1,
                      cursorColor: Colors.black,
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
                        label: Text("Save Update Note"),
                        onPressed: () async {
                          await NoteServices(noteId: note.id).updateNote(Note(
                            id: note.id,
                            lecturerId: widget.lecturerId,
                            name: nameController.text,
                            body: bodyController.text,
                            day: DateTime.now(),
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Color(0xff622545),
                            content: Text('Your Note Updated'),
                          ));
                          Navigator.of(context).pop();
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