import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'models/Data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiServices {
  var url = Uri.http('192.168.1.154', '/home/gets/get_last.php');

  Stream<List<Data>> getAllReadings() async* {
    while (true) {
      final Response response = await get(url);
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        final List<Data> dataList =
        result.map((e) => Data.fromJson(e)).toList();
        yield dataList;
      } else {
        throw Exception(response.reasonPhrase);
      }
      await Future.delayed(Duration(seconds: 10));
    }
  }
}

final dataProvider = Provider<ApiServices>((ref) => ApiServices());

final readingsDataProvider = StreamProvider.autoDispose<List<Data>>((ref) async* {
  final api = ref.watch(dataProvider);
  yield* api.getAllReadings();
});
