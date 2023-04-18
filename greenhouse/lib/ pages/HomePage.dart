import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/LiveData.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
        drawer: Drawer(
          backgroundColor: Theme.of(context).backgroundColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Victor Florescu"),
                accountEmail: Text("victor.s.florescu@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Text("VF"),
                ),
                // onDetailsPressed: (){
                //
                // },
              ),
              // ListTile(
              //   leading: Icon(Icons.home),
              //   title: Text("Home"),
              //   onTap: () {
              //     Navigator.pop(context);
              //     // navigate to home screen
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: () {
                  Navigator.pop(context);
                  // navigate to profile screen
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                  // navigate to settings screen
                },
              ),
              ListTile(
                leading: Icon(Icons.workspace_premium),
                title: Text("Premium"),
                onTap: () {
                  Navigator.pop(context);
                  // navigate to settings screen
                },
              ),
              ListTile(
                leading: Icon(Icons.question_mark),
                title: Text("About Us"),
                onTap: () {
                  Navigator.pop(context);
                  // navigate to settings screen
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                  // perform logout operation
                },
              ),
            ],
          ),
        ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight * 1.2),
        child: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).backgroundColor,
          centerTitle: true,
          title: Text(
              "Home",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: screenWidth * 0.060),
          ),
        ),

      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: screenHeight * 0.01,
                  //     left: screenWidth * 0.05,
                  //     right: screenWidth * 0.05,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             'Hello Victor', // add user name from account
                  //             style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: screenWidth * 0.085),
                  //           ),
                  //           SizedBox(height: screenHeight * 0.01),
                  //           Text(
                  //             'Welcome back !',
                  //             style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: screenWidth * 0.050),
                  //           ),
                  //         ],
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: screenWidth * 0.03,
                  //             vertical: screenWidth * 0.04,
                  //         ),
                  //         child: IconButton(
                  //           onPressed: (){
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(builder: (context) => YourPlant()),
                  //             );
                  //           },
                  //           icon: Icon(Icons.adjust_rounded), // here modify with the tree logo or some shit
                  //           iconSize: screenWidth * 0.20,
                  //           color: Theme.of(context).secondaryHeaderColor,
                  //           //highlightColor: Colors.transparent,
                  //           //splashColor: Colors.transparent,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.04,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.03,
                          ),
                          child: Center(
                            child: Text(
                              "Your garden",
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: screenWidth * 0.07),
                            ),
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
                    child: Container(
                      height: screenHeight * 0.48,
                      child: PageView(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        children: [
                          LiveData(id: 1),
                          LiveData(id: 2),
                          LiveData(id: 3), /// make it dynamic depending on the number of plants u have.
                        ],
                      ),
                    )
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       vertical: screenHeight * 0.01,
                  //       horizontal: screenWidth * 0.15
                  //   ),
                  //   child: Center(
                  //       child: Container(
                  //         height: screenHeight * 0.008,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(40),
                  //             color: Theme.of(context).primaryColor
                  //         ),
                  //       )
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.03,
                    ),
                    child: Center(
                      child: Text(
                        "Your friends",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: screenWidth * 0.07),
                      ),
                    ),
                  ),
                  /// list view of friends here
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
