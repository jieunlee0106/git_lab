import 'package:get/get.dart';
import 'package:logger/logger.dart';

//회원 관련 프로바이더 ex) login, register, findPassword
class UserProvider extends GetConnect {
  final logger = Logger();
  Map<String, String> headers = {
    'Content-Type': 'application',
  };
  Future<Response?> postLogin(
      {required String email, required String password}) async {
    final body = {
      'email': email,
      'password': password,
    };
    try {
      final response = await post("https://", body, headers: headers);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to Login');
      }
    } catch (e) {
      logger.e(e);
    }
    return null;
  }
}
