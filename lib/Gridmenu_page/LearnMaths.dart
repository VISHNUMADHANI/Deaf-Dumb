import 'package:flutter/material.dart';

class LearnMaths extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LearnMathsState createState() => _LearnMathsState();
}

class _LearnMathsState extends State<LearnMaths> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Maths"),
      ),
      body: Container(color: Colors.amber),
    );
  }
}
