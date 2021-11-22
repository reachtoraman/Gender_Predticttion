import 'package:flutter/material.dart';
import 'package:gender_prediction/API/gender_prediction_api.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            TextField(
                controller: controller,
                onChanged: (value) {
                  value = controller.text;
                },
                decoration: InputDecoration(
                  label: Text('Please Enter the name'),
                )),
            RaisedButton(
              onPressed: () {
                GendeerApi.main();
              
              },
              child: Text('post'),
            )
          ],
        ),
      ),
    );
  }
}
