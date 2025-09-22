import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/config/app_router.dart';
import 'package:my_chat/config/app_router.gr.dart';
import 'package:my_chat/presentation/common/providers/auth_provider.dart';

// intercept outgoing and incoming request - use for handling token experation and refresh
class AuthInterceptor extends Interceptor {
  final Dio dio;
  // Provider container to access Riverpod providers - don't need widget context
  final ProviderContainer container;

  AuthInterceptor(this.dio, this.container);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final secureStorageService = container.read(secureStorageServiceProvider);
    final accessToken = await secureStorageService.getAccessToken();
    
    // attach the token to the request before sending
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Unauthorized error - token might be expired
      final requestOptions = err.requestOptions;
      
      // Attempt to refresh the token
      try {
        final authRepository = container.read(authRepositoryProvider);
        final newAccessToken = await authRepository.refreshToken();

        // Update the header with the new token
        requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

        // Retry the original request
        final retryResponse = await dio.fetch(requestOptions);
        return handler.resolve(retryResponse);
      } catch (e) {
        // Refresh token failed
        // Delete all tokens
        container.read(authProvider.notifier).logout();
        // Redirect to login page
        container.read(appRouterProvider).replaceAll([const LoginRoute()]);
        return handler.reject(err);
      }
    }
    super.onError(err, handler);
  }
}