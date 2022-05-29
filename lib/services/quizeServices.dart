import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ppu_attendance/classes/quize.dart';
import 'package:ppu_attendance/classes/studentsQuize.dart';

class QuizeServices {
  final int? courseNo;
  final int? sectionNo;
  final int? lecturerId;
  final int? quizeId;

  QuizeServices({
    this.courseNo,
    this.sectionNo,
    this.lecturerId,
    this.quizeId,
  });

  Future<List<Quize>> get quizzes async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/quizzes/${this.lecturerId}/${this.courseNo}/${this.sectionNo}"));

    final myList = <Quize>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final attendance = Quize.fromJson(item);
          myList.add(attendance);
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

  // Future<Quize> get quizeBylecturer async {
  //   var res = await http
  //       .get(Uri.parse("http://10.0.2.2:3000/quize/${this.lecturerId}"));

  //   final myList = <Quize>[];

  //   if (res.statusCode == 200) {
  //     try {
  //       dynamic jsonList = json.decode(res.body);
  //       if (jsonList is! List) throw FormatException();
  //       for (dynamic item in jsonList) {
  //         if (item is! Map<String, dynamic>) continue;
  //         final attendance = Quize.fromJson(item);
  //         myList.add(attendance);
  //       }
  //     } on FormatException {
  //       print('JSON is in the wrong format');
  //     }
  //     print(myList);
  //     return myList.first;
  //   } else {
  //     throw Exception('Failed to load Quize');
  //   }
  // }

  Future<int?> createQuize(Quize quize) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/quize/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(quize.toJson()),
    );

    if (response.statusCode == 200) {
      var res = await http.get(Uri.parse("http://10.0.2.2:3000/quize/last"));
      final myList = <Quize>[];
      if (res.statusCode == 200) {
        try {
          dynamic jsonList = json.decode(res.body);
          if (jsonList is! List) throw FormatException();
          for (dynamic item in jsonList) {
            if (item is! Map<String, dynamic>) continue;
            final quize = Quize.fromJson(item);
            myList.add(quize);
          }
        } on FormatException {
          print('JSON is in the wrong format');
        }
        print(myList);
        return myList.first.id;
      } else {
        throw Exception('Failed to load Quize');
      }
    } else {
      print(response.body);
      throw Exception('Failed to create Quize.');
    }
  }

// /quize/last
  Future<String> createQuizeStudents(
      List<Map<String, dynamic>> quizeStudent) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/studentquize/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(quizeStudent),
    );

    if (response.statusCode == 200) {
      return "Done";
    } else {
      print(response.body);
      throw Exception('Failed to create Quize.');
    }
  }

  Future<List<StudentsQuize>> get studentsMark async {
    var res = await http
        .get(Uri.parse("http://10.0.2.2:3000/studentquize/${this.quizeId}"));

    final myList = <StudentsQuize>[];

    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final studentQuize = StudentsQuize.fromJson(item);
          myList.add(studentQuize);
        }
      } on FormatException {
        print('JSON is in the wrong format');
      }
      print(myList);
      return myList;
    } else {
      throw Exception('Failed to load Students Quize');
    }
  }

  Future<int>? get quizeCount async {
    var res = await http.get(Uri.parse(
        "http://10.0.2.2:3000/quize/count/${this.lecturerId}/${this.courseNo}/${this.sectionNo}"));

    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        int count =0;
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          count = item['count'];
        }

        print(count.toString());
        return count;
      } catch (error) {
        print('JSON is in the wrong format');
        return 0;
      }
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Quize> get quizeById async {
    var res = await http
        .get(Uri.parse("http://10.0.2.2:3000/quize/${this.quizeId}"));

    final myList = <Quize>[];

    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final attendance = Quize.fromJson(item);
          myList.add(attendance);
        }
      } on FormatException {
        print('JSON is in the wrong format');
      }
      print(myList);
      return myList.first;
    } else {
      throw Exception('Failed to load Quize');
    }
  }

Future<String?> updateQuize(Quize quize) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/quize/update/${this.quizeId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(quize.toJson()),
    );

    if (response.statusCode == 200) {
      return "Done";
    } else {
      print(response.body);
      throw Exception('Failed to create note.');
    }
  } 


  Future<String> updateQuizeStudents(
      List<Map<String, dynamic>> quizeStudent) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/studentquize/update'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(quizeStudent),
    );

    if (response.statusCode == 200) {
      return "Done";
    } else {
      print(response.body);
      throw Exception('Failed to update Student Quize.');
    }
  }
}
