// All Flutter Built-in Imports Here.

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

import 'package:dio/dio.dart';

/// Api service to get data.
final Dio _dio = Dio();

Future getData() async {
  try {
    final response = await _dio.get(
        'https://devconnect.spyn.co/api/web/v4/homepage/index?venue_id=729');

    final data = response.data;
    return data != null ? Map<String, dynamic>.from(data) : null;
  } catch (error) {
    print(error);
    rethrow;
  }
}
