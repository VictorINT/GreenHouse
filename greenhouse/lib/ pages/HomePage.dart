import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:greenhouse/widgets/LiveData.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 70,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Victor', // add user name from account
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 3
                        )
                    ),
                    Text(
                      'Welcome back !',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.adjust_rounded), // here modify with the tree logo or some shit
                    iconSize: 100,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 30
                        ),
                        child: Center(
                          child: Text(
                            "Information",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 50
                        ),
                        child: Center(
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                              color: Theme.of(context).primaryColor
                            ),
                          )
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 30
                  ),
                  child: LiveData(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
