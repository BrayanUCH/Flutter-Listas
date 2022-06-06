import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class student {
  final String Name;
  final String date;
  final String id;

  student(this.Name, this.date, this.id);

  student.fromSnapshot(String id, Map<String, dynamic> studentss)
      : Name = studentss['name'],
        date = studentss['date'],
        id = studentss['id'];

  Map<String, dynamic> toMap() => {
        'name': Name,
        'date': date,
        'id': id,
      };
}
