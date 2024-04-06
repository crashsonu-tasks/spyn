// All Flutter Built-in Imports Here.

// All Custom Imports Here.
import 'package:dio/dio.dart';

// All Native Imports Here.

// All Attributes or Constants Here.

/// Api service to get data form api call.
final Dio _dio = Dio();

Future getData() async {
  try {
    final response = await _dio.get(
        'https://devconnect.spyn.co/api/web/v4/homepage/index?venue_id=729');

    final data = response.data;
    return Map<String, dynamic>.from(data);
  } catch (error) {
    return {};
  }
}
