import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourPlant extends StatefulWidget {
  const YourPlant({Key? key}) : super(key: key);

  @override
  State<YourPlant> createState() => _YourPlantState();
}

class _YourPlantState extends State<YourPlant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
        ),
      body: Container(

      ),
    );
  }
}
