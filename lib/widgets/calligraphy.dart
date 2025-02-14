import 'package:flutter/material.dart';

class Calligraphy extends StatelessWidget {
  const Calligraphy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Image.asset("assets/img/reading.png", height: height * 0.4),
    );
  }
}
