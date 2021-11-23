import 'package:flutter/material.dart';

class ApiClass {
  String? name;
  String? gender;
  dynamic? probability;
  // ignore: unnecessary_question_mark
  dynamic ? count;

  ApiClass(
      {required this.name,
      required this.gender,
      required this.probability,
      required this.count});

  factory ApiClass.fromJson(Map<String, dynamic> json) {
    return ApiClass(
        name: json['name'],
        gender: json['gender'],
        probability:json['probability'],
        count:json['count']);
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['gender'] = gender;
    data['probability'] = probability;
    data['count'] = count;
    return data;
  }
}
