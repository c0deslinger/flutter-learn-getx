import 'package:dio/dio.dart';
import 'package:example_getx_restapi/app/models/user.dart';

class UserApi {
  UserApi._internal();

  static final UserApi _instance = UserApi._internal();
  static UserApi get instance => _instance;

  final _dio = Dio();

  Future<List<User>> getUser(int page) async {
    Response response = await _dio
        .get("https://reqres.in/api/users", queryParameters: {"page": page});

    return (response.data["data"] as List)
        .map((e) => User.fromJson(e))
        .toList();
  }
}
