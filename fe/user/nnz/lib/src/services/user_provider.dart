import 'package:get/get.dart';
import 'package:logger/logger.dart';

//회원 관련 프로바이더 ex) login, register, findPassword
class UserProvider extends GetConnect {
  final logger = Logger();
  Map<String, String> headers = {
    'Content-Type': 'application',
  };

  //로그인 api 통신
  Future<Response?> postLogin(
      {required String email, required String password}) async {
    final body = {
      'email': email,
      'password': password,
    };
    try {
      final response = await post("https://", body, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to Login');
      }
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  //테스트 이메일 중복확인 api
  void testApi({required String email}) {
    logger.i("이메일 중복확인 해줘 $email");
  }

  //이메일 중복확인 api
  Future<Response?> getValidateEmail({required String email}) async {
    try {
      final response = await get("https://$email", headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  //닉네임 중복확인 api
  Future<Response?> getVaildateNickname({required String nickname}) async {
    try {
      final response = await get("https://$nickname", headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.hasError) {
        logger.e(response.statusCode);
        logger.e(response.statusText);
        logger.e(response.hasError);
      }
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  //회원가입 api
  Future<Response?> postRegister() async {
    final body = {
      'email': '',
      'password': '',
      'passwordConfirm': '',
      'nickname': '',
      'phone': '',
    };
    try {
      final response = await post("https://", body, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      logger.e(e);
    }
    return null;
  }
}
