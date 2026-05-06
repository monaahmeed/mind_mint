import 'package:dio/dio.dart';

class QuestionsWebServices {
  late Dio dio;
  QuestionsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://opentdb.com/',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20), 
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getQuestions({
    required int amount,
    required int category,
    required String difficulty,
    required String type,
  }) async {
    try {
      Response response = await dio.get(
        'api.php',
        queryParameters: {
          'amount': amount,
          'category': category,
          'difficulty': difficulty,
          'type': type,
        },
      );
      
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return []; 
    }
  }
}

