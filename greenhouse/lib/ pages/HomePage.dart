import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenhouse/%20pages/YourPlant.dart';
import 'package:greenhouse/widgets/LiveData.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.05,
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello Victor', // add user name from account
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: screenWidth * 0.085),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Text(
                              'Welcome back !',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: screenWidth * 0.055),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                              vertical: screenWidth * 0.04,
                          ),
                          child: IconButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => YourPlant()),
                              );
                            },
                            icon: Icon(Icons.adjust_rounded), // here modify with the tree logo or some shit
                            iconSize: screenWidth * 0.20,
                            color: Theme.of(context).secondaryHeaderColor,
                            //highlightColor: Colors.transparent,
                            //splashColor: Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.04,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.03,
                            horizontal: screenWidth * 0.1,
                          ),
                          child: Center(
                            child: Text(
                              "Information",
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: screenWidth * 0.08),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.01,
                              horizontal: screenWidth * 0.15
                          ),
                          child: Center(
                              child: Container(
                                height: screenHeight * 0.008,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Theme.of(context).primaryColor
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03,
                      horizontal: screenWidth * 0.1,
                    ),
                    child: LiveData(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
