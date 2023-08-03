import 'package:flutter_application_1/models/queue_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "https://dev-kiosk-api.tabling.co.kr";

  static Future<List<QueueModel>> getQueueListOf(restaurantsIdx) async {
    List<QueueModel> queueInstance = [];

    final String today = 'v1/restaurants/$restaurantsIdx/waiting-display';
    final url = Uri.parse('$baseUrl/$today');
    http.Response response = await http.get(url); // Future 타입은 보통 비동기로 처리한다.

    if (response.statusCode == 200) {
      for (var queue in jsonDecode(response.body)['list']) {
        queueInstance.add(QueueModel.fromJson(queue));
      }
      print(queueInstance);
      return queueInstance;
    }
    throw Error();
  }
}
