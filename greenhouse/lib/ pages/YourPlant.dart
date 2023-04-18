import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/AutoWaterButton.dart';

import '../widgets/WaterPlantButton.dart';

class YourPlant extends StatefulWidget {
  final int id;

  const YourPlant({Key? key, required this.id}) : super(key: key);

  @override
  State<YourPlant> createState() => _YourPlantState();
}

class _YourPlantState extends State<YourPlant> {
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight * 1.2),
          child: AppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: 1,
            title: Text(
              widget.id.toString(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: screenWidth * 0.07),
            ),
            centerTitle: true,
          ),
        ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: screenHeight * 0.1,
                          top: screenHeight * 0.09,
                        ),
                        child: Container(
                          child: Icon(
                              Icons.ac_unit,
                            size: screenHeight * 0.4,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WaterPlantButton(),
                        AutoWaterButton(),
                      ],
                    ),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
