import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaterPlantButton extends StatelessWidget {
  const WaterPlantButton({Key? key}) : super(key: key);

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
                  "feed",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color.fromRGBO(253, 255, 255, 1)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
