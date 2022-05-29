import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ppu_attendance/classes/student.dart';

class StudentsServices {
  final int? courseNo;
  final int? sectionNo;
  final int? studentId;

  StudentsServices({
    this.courseNo,
    this.sectionNo,
    this.studentId,
  });

  Future<List<Student>> get students async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/students/${this.courseNo}/${this.sectionNo}"));

    final myList = <Student>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final student = Student.fromJson(item);
          myList.add(student);
        }
      } on FormatException {
        print('JSON is in the wrong format');
      }
      print(myList);
      return myList;
    } else {
      throw Exception('Failed to load album');
    }
  }


  
  Future<Student> get studentById async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/student/${this.studentId}"));

    final myList = <Student>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final student = Student.fromJson(item);
          myList.add(student);
        }
      } on FormatException {
        print('JSON is in the wrong format');
      }
      print(myList);
      return myList.first;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
