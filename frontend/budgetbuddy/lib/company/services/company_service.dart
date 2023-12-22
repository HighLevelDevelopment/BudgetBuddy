/*
Consume http://localhost:8080/Company to get Company Data with dio package

Example API Return

{"remainingPages":0,"currentPage":1,"countItems":1,"totalItems":1,"rowsPerPage":0,"data":[{"idCompany":4,"name":"Pedro Moreira LTDA.","trading":"Peedroca Empresas Codinome","document":"1234"}]}

use same route to create and update with POST method and the below body

{
    "id": 0,
    "name": "Ingenico",
    "trading": "Ingenico Limitada do Brasil",
    "document": "3344"
}
*/

import 'package:dio/dio.dart';
import 'package:budgetbuddy/company/models/company.dart';

class CompanyService {
  final String _baseUrl = 'http://129.148.54.19:8080/Company';
  final Dio _dio = Dio()..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  Future<List<Company>> getCompanies() async {
    final response = await _dio.get(_baseUrl);
    return (response.data['data'] as List)
        .map((e) => Company.fromJson(e))
        .toList();
  }

  Future<Company> createOrUpdateCompany(Company company) async {
    final response = await _dio.post(_baseUrl, data: company.toJson());
    return Company.fromJson(response.data);
  }

  Future<void> deleteCompany(String document) async {
    await _dio.delete('$_baseUrl/$document');
  }
}
