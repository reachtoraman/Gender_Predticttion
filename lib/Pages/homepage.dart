import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:gender_prediction/API/gender_prediction_api.dart';
import 'package:gender_prediction/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController controller = TextEditingController();
  bool isApi = false;

  main(
    String name,
  ) async {
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

  var response;

  @override
  void initState() {
    super.initState();
    isApi = true;
   response= main('ladu');
    isApi = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    AppColor.gradientStartColor,
                    AppColor.gradientFirstColor,
                    AppColor.gradientSecondColor,
                    AppColor.gradientThirdColor,
                    AppColor.gradientFourthColor,
                    AppColor.gradientEndColor,
                  ])),
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: TextField(
                              controller: controller,
                              onChanged: (value) {
                                value = controller.text.toString();
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  'Please Enter the Name',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            isApi = true;
                            GendeerApi.main(
                              controller.text.toString(),
                            );
                          },
                          child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(Icons.arrow_forward)),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height * 0.60,
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        // borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 80),
                      height: MediaQuery.of(context).size.height * 0.43,
                      width: MediaQuery.of(context).size.width * 0.70,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                '',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 40),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                'Gender : male',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                'Chance of correcton : 0.90',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 110),
                      alignment: Alignment.topCenter,
                      height: 300,
                      child: Image(
                        image: AssetImage('assets/male.png'),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                        colorBlendMode: BlendMode.color,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
