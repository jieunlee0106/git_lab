import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SharingRegisterProvider extends GetConnect {
  final logger = Logger();
  final headers = {
    'Content-Type': 'application/json',
  };

  @override
  void onInit() async {
    await dotenv.load();
    httpClient.baseUrl = dotenv.env['BASE_URL'];
    httpClient.timeout = const Duration(milliseconds: 5000);
    super.onInit();
  }

  //공연 목록 검색
  Future<Response> getShowList({required String category}) async {
    try {
      final response = await get("/show?=$category", headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        final errorMessage = "(${response.statusCode}): ${response.body}";
        logger.e(errorMessage);
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorMessage = "$e";
      logger.e(errorMessage);
      throw Exception(errorMessage);
    }
  }

  //카테고리 조회
  Future<Response> getCategory({required String parent}) async {
    try {
      final response =
          await get("/shows/categories?=$parent", headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        final errorMessage = "(${response.statusCode}): ${response.body}";
        logger.e(errorMessage);
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorMessage = "$e";
      logger.e(errorMessage);
      throw Exception(errorMessage);
    }
  }
}
