import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gender_prediction/API/gender_prediction_api.dart';
import 'package:gender_prediction/Model/model.dart';
import 'package:gender_prediction/utils/utils.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController controller = TextEditingController();
  bool isApi = false;

  Future<ApiClass>? futureapi;

  @override
  void initState() {
    super.initState();
    futureapi = main1(controller.text.toString());

    // ignore: avoid_print
    print('future $futureapi');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFFF8D8C9),
      systemNavigationBarDividerColor: Color(0xFFF8D8C9),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
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
                          margin: const EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: TextField(
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              controller: controller,
                              onChanged: (value) {
                                value = controller.text;
                              },
                              decoration: const InputDecoration(
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
                          onTap: () async {
                            futureapi = main1(controller.text);

                            setState(() {});
                          },
                          child: Container(
                              height: 50,
                              width: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(Icons.arrow_forward)),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height * 0.60,
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 80),
                      height: MediaQuery.of(context).size.height * 0.42,
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      height: MediaQuery.of(context).size.height * 0.41,
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.42,
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
                                child: FutureBuilder<ApiClass>(
                                    future: futureapi,
                                    builder: (
                                      context,
                                      snapshot,
                                    ) {
                                      if (snapshot.hasData) {
                                        return Text(
                                            snapshot.data!.name
                                                .toString()
                                                .toUpperCase(),
                                            style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 40));
                                      } else if (snapshot.hasError) {
                                        return const Text(
                                            'Name :Plaese Enter the Name');
                                      }
                                      return const CircularProgressIndicator();
                                    })),
                            Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: FutureBuilder<ApiClass>(
                                    future: futureapi,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                            'GENDER : ${snapshot.data!.gender!.toUpperCase()}',
                                            style: const TextStyle(
                                              color: Colors.black45,
                                              fontSize: 20,
                                            ));
                                      } else if (snapshot.hasError) {
                                        return const Text(
                                            'Gender : I will Guess your Gender');
                                      }
                                      return const CircularProgressIndicator();
                                    })),
                            Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: FutureBuilder<ApiClass>(
                                    future: futureapi,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text.rich(TextSpan(children: [
                                          const TextSpan(
                                              text: 'PROBABILITY :',
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 20,
                                              )),
                                          TextSpan(
                                              text:
                                                  ' ${snapshot.data!.probability}',
                                              style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 20,
                                              )),
                                        ]));

                                       
                                      } else if (snapshot.hasError) {
                                        return const Text(
                                            'Probability: My Prediction Percentage ');
                                      }
                                      return const CircularProgressIndicator();
                                    })),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 110),
                      alignment: Alignment.topCenter,
                      height: 300,
                      child: FutureBuilder<ApiClass>(
                          future: futureapi,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Image(
                                  image: AssetImage(
                                      snapshot.data!.gender!.contains('female')
                                          ? 'assets/female.png'
                                          : 'assets/male.png'),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill,
                                  colorBlendMode: BlendMode.color);
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200)),
                                  margin: const EdgeInsets.only(top: 80),
                                  alignment: Alignment.topCenter,
                                  height: 300,
                                  width: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: const Image(
                                        image: AssetImage(
                                            'assets/male_female.jpg'),
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.color),
                                  ),
                                ),
                              );
                            }
                            return const CircularProgressIndicator();
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
