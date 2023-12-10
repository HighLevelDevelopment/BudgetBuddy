import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/company_model.dart';

class CompanyService {
  late Dio dio;

  CompanyService() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:8080',
      headers: {
        'accept': '*/*'
      }
    ));//..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<void> fetchData() async {
    try {
      final response = await dio.get('/Company');
      
      if (response.statusCode == 200) {
        final responseData = response.data;
        debugPrint(responseData['data'][0]['trading']);
      }
    } on Exception catch (e) {
      debugPrint("Error on get data: $e");
    }
  }
}