import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<Response> login(String email, String password) async {
    try {
      return await dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
    } on DioException catch (e) {
      // handle in auth interceptor
      print("Error :");
      print(e);
      rethrow; 
    }
  }

  Future<Response> refreshToken(String refreshToken) async {
    return await dio.post(
      '/auth/refresh-token',
      data: {
        'refreshToken': refreshToken,
      },
    );
  }
}