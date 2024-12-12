import 'package:dio/dio.dart';
// 추상클래스, DIO 클라이언트 객체

abstract class BaseRemoteRepository {
  // getter
  Dio get client => _client;

  static Dio _client = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.0.48:8080',
      // 설정안할 시 실패응답오면 throw 발생해서 에러남
      validateStatus: (status) => true,
    ),
  )..interceptors.add(authInterceptor);
  static AuthInterceptor authInterceptor = AuthInterceptor();
}

class AuthInterceptor extends Interceptor {
  String? bearerToken;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (bearerToken != null) {
      options.headers.addAll(
        {
          'Authorization': bearerToken,
        },
      );
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    // response uri가 login일때, status code가 200일때
    // response header에 있는 authorization을 bearerToken에 저장
    if (response.realUri.path == '/login' && response.statusCode == 200) {
      final token = response.headers['Authorization'];
      bearerToken = token?.first;
    }
    super.onResponse(response, handler);
  }
}
