import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ pages/YourPlant.dart';
import '../services/services.dart';

class LiveData extends ConsumerWidget {

  final int id;

  const LiveData({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {

    final _data = ref.watch(readingsDataProvider);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
          child: InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YourPlant(
                        id:id
                      )
                  )
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight * 0.05),
                color: Color.fromRGBO(48,54,54, 1),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03,
                      horizontal: screenWidth * 0.02,
                    ),
                    child: Center(
                      child: _data.when(
                        data: (_data){
                            return Text(
                                id.toString(),
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: screenWidth * 0.06),
                            ); /// modify with the plant name from db
                        },
                        error: (err, s) => Text(err.toString()),
                        loading: () => const CircularProgressIndicator(),
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
                          height: screenHeight * 0.004,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Theme.of(context).canvasColor
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03,
                      horizontal: screenWidth * 0.02,
                    ),
                    child: Center(
                      child: _data.when(
                        data: (_data){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: screenHeight * 0.015,
                                ),
                                child: Text(
                                  "Room",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                       Icon(
                                        Icons.sunny,
                                        size: 0.12 * screenWidth,
                                        color: Color.fromRGBO(255, 212, 0, 1.0),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.02
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              // _data.value?.first.id != null ? '${_data.value?.first.id}' : "No id",
                                              _data.first.temperature != null ? '${_data.first.temperature}' : "0",
                                              style: Theme.of(context).textTheme.bodyLarge,
                                            ),
                                            const Text(
                                                "°C"
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.air,
                                        size: 0.12 * screenWidth,
                                        color: Color.fromRGBO(96, 159, 200, 1.0),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.02
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              // _data.value?.first.id != null ? '${_data.value?.first.id}' : "No id",
                                              _data.first.humidity != null ? '${_data.first.humidity}' : "0%",
                                              style: Theme.of(context).textTheme.bodyLarge,
                                            ),
                                            const Text(
                                                "%"
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          );
                        },
                        error: (err, s) => Text(err.toString()),
                        loading: () => const CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       vertical: screenHeight * 0.01,
                  //       horizontal: screenWidth * 0.15
                  //   ),
                  //   child: Center(
                  //       child: Container(
                  //         height: screenHeight * 0.004,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(40),
                  //             color: Theme.of(context).canvasColor
                  //         ),
                  //       )
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.001,
                    ),
                    child: Container(
                      // height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenHeight * 0.05),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.03,
                          horizontal: screenWidth * 0.02,
                        ),
                        child: Center(
                          child: _data.when(
                            data: (_data){
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: screenHeight * 0.015,
                                    ),
                                    child: Text(
                                      "Plant",
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.water_drop_sharp,
                                            size: 0.12 * screenWidth,
                                            color: Color.fromRGBO(19, 241, 200, 1.0),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.02
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  (_data.first.soil_humidity != null) ? (int.parse(_data.first.soil_humidity!) * 100 / 180).toStringAsFixed(1) : "0",
                                                  style: Theme.of(context).textTheme.bodyLarge,
                                                ),
                                                const Text(
                                                    "%"
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                            error: (err, s) => Text(err.toString()),
                            loading: () => const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       vertical: screenHeight * 0.01,
                  //       horizontal: screenWidth * 0.15
                  //   ),
                  //   child: Center(
                  //       child: Container(
                  //         height: screenHeight * 0.004,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(40),
                  //             color: Theme.of(context).canvasColor
                  //         ),
                  //       )
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
  }
}

/**
 * TODO
 * -> add more plants, so id for which one.
 */