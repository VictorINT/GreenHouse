import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/services.dart';

class LiveData extends ConsumerWidget {
  const LiveData({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(readingsDataProvider);
    return StreamBuilder(
      // stream build ??
      builder: (context, snapshot){
        return Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Theme.of(context).cardColor,
              ),
              child: Center(
                child: _data.when(
                  data: (_data){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Room",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.sunny,
                                  size: 60,
                                  color: Color.fromRGBO(255, 212, 0, 1.0),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10
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
                                const Icon(
                                  Icons.air,
                                  size: 60,
                                  color: Color.fromRGBO(96, 159, 200, 1.0),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10
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
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20
              ),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Theme.of(context).cardColor,
                ),
                child: Center(
                  child: _data.when(
                    data: (_data){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Plant",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.water_drop_sharp,
                                    size: 60,
                                    color: Color.fromRGBO(19, 241, 200, 1.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          // _data.value?.first.id != null ? '${_data.value?.first.id}' : "No id",
                                          _data.first.soil_humidity != null ? '${_data.first.soil_humidity}' : "0",
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                        const Text(
                                            "/180"
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
          ],
        );
      }

    );
  }
}

/**
 * TODO
 * -> add more plants, so id for which one.
 */