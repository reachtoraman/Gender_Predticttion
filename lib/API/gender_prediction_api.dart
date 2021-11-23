import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gender_prediction/Model/model.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

// Future<ApiClass> main1(
//   String name,
// ) async {
//   var baseUrl = 'https://api.genderize.io?name=$name';
//   // This example uses the Google Books API to search for books about http.
//   // https://developers.google.com/books/docs/overview
//   var url = Uri.parse(baseUrl);

//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.get(url);

//   print(response.body);

//   if (response.statusCode == 200) {
//     var jsonResponse =
//         convert.jsonDecode(response.body) as Map<String, dynamic>;

//     return ApiClass.fromJson(jsonDecode(response.body));
//   } else if (ConnectionState == ConnectionState.none) {
//     print('Request failed with status: ${response.statusCode}.');
//   }
//   throw Exception(e);
// }

Future<ApiClass> main1(String name,) async {
  final response =
      await http.get(Uri.parse('https://api.genderize.io?name=$name'));
  
  print(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ApiClass.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
