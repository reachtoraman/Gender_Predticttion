import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class GendeerApi {
  static const baseUrl = 'https://api.genderize.io?name=raman';

  static main() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = Uri.parse(GendeerApi.baseUrl);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url);
    print(response.body[1]);

    if (response.statusCode == 200) {
      // ignore: unrelated_type_equality_checks
      if (ConnectionState == ConnectionState.done) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        return response.body[0];
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }
}
