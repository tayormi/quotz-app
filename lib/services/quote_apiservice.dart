import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quotz/models/quote_model.dart';

class QuoteService {
  Dio _dio;

  QuoteService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        baseUrl: "https://x8ki-letl-twmt.n7.xano.io/api:0RVh3XT-");
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<List<QuoteModel>> getQuotes() async {
    final url = '/quote';
    try {
      final response = await _dio.get(url);
      List<QuoteModel> quotes = quoteModelFromJson(response.data);
      return quotes;
    } on DioError catch (e) {
      print(e.error);
      throw e.error;
    }
  }
}
