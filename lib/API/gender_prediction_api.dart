import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class GendeerApi {
  static main(String name,) async {
    var baseUrl = 'https://api.genderize.io?name=$name';
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = Uri.parse(baseUrl);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
   
      print('json response$jsonResponse');

      return jsonResponse;
    } else if (ConnectionState == ConnectionState.none) {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
