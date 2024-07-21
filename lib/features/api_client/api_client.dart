import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quick_workout/features/models/server_response/server_response.dart';

class ApiClient {
  static final dio = Dio();
  static Future<bool> postData(userData) async {
    final String url = ServerResponse.serverResponse!.oneZeroLink!;
    try {
      final response = await dio.get(url,
          options: Options(headers: {
            "value": "application/json",
          }),
          data: {'userData': userData});
      final data = jsonDecode(response.data);
      final authCheck = data[ServerResponse.serverResponse?.token];
      return authCheck;
    } catch (e) {
      print(e);
      return true;
    }
  }

  static Future<ServerResponse?> getJson() async {
    const String url = 'https://appstorage.org/api/conf/qu1ckw0rk0ut';
    try {
      final response = await dio.get(url,
          options: Options(headers: {
            "key": "Accept",
            "value": "application/json",
            "type": "text"
          }));
      final data = response.data;
      return ServerResponse.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
