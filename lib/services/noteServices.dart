import 'package:http/http.dart' as http;
import 'package:ppu_attendance/classes/note.dart';
import 'dart:convert';

class NoteServices {
  int? noteId;
  int? lecturerId;
  NoteServices({this.noteId,this.lecturerId});

  Future<List<Note>> get notes async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/notes/${this.lecturerId}"));

    final myList = <Note>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final note = Note.fromJson(item);
          myList.add(note);
        }
      } on FormatException {
        print('JSON is in the wrong format');
      }
      print(myList);
      return myList;
    } else {
      throw Exception('Failed to load note');
    }
  }

  
  Future<Note> get noteById async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/note/${this.noteId}"));

    final myList = <Note>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final student = Note.fromJson(item);
          myList.add(student);
        }
      } on FormatException {
        print('JSON is in the wrong format');
      }
      print(myList);
      return myList.first;
    } else {
      throw Exception('Failed to load Note');
    }
  }
  Future<String> createNote(Note note) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/note/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(note.toJson()),
    );

    if (response.statusCode == 200) {
      return "Done";
    } else {
      print(response.body);
      throw Exception('Failed to create note.');
    }
  }
 Future<String> updateNote(Note note) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/note/update/${this.noteId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(note.toJson()),
    );

    if (response.statusCode == 200) {
      return "Done";
    } else {
      print(response.body);
      throw Exception('Failed to create note.');
    }
  }
  Future<void> deleteNote(int id) async {
    var res =
        await http.get(Uri.parse("http://10.0.2.2:3000/note/delete/$id"));

    if (res.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to load note');
    }
  }
}
