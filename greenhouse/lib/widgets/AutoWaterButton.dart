import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoWaterButton extends StatefulWidget {
  const AutoWaterButton({Key? key}) : super(key: key);

  @override
  State<AutoWaterButton> createState() => _AutoWaterButtonState();
}

class _AutoWaterButtonState extends State<AutoWaterButton> {
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      child: InkWell(
        child: Container(
          width: screenWidth*0.44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight * 0.02),
              color: Theme.of(context).primaryColor
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenHeight * 0.045,
            ),
            child: Center(
              child: Text(
                "auto",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color.fromRGBO(253, 255, 255, 1)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
