import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ppu_attendance/classes/note.dart';
import 'package:ppu_attendance/components/drawer.dart';
import 'package:ppu_attendance/components/noteComponent/addNote.dart';
import 'package:ppu_attendance/components/noteComponent/updateNote.dart';
import 'package:ppu_attendance/services/noteServices.dart';

class NoteList extends StatefulWidget {
  final int lecturerId;
  NoteList({Key? key,required this.lecturerId}) : super(key: key);

  @override
  State<NoteList> createState() => TNoteListState();
}

class TNoteListState extends State<NoteList> {
  Future<void> _refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
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
      body: FutureBuilder<List<Note>>(
        future: NoteServices(lecturerId: widget.lecturerId).notes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Note>? notes = snapshot.data;
            return RefreshIndicator(
              color: Color(0xff622545),
              onRefresh: _refresh,
              child: ListView.builder(
                itemCount: notes!.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 0,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateNote(noteId: notes[index].id,lecturerId: widget.lecturerId,)),
                          );
                        },
                        leading: Icon(Icons.notes),
                        title: Text(
                          notes[index].name,
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
                            color: Color(0xff622545),
                          ),
                        ),
                        subtitle: Text(notes[index].body),
                        trailing: Column(
                          children: [
                            Text(DateFormat.yMMMMd('en_US').format(notes[index].day)),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.delete),
                                // color: Colors.white,
                                onPressed: () async {
                                  await NoteServices().deleteNote(notes[index].id!);
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } 
          else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNote(lecturerId: widget.lecturerId,)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}