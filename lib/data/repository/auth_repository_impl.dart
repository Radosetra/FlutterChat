
import 'package:my_chat/core/secure_storage_service.dart';

import 'package:my_chat/data/datasource/auth_remote_data_source.dart';

import 'package:my_chat/domain/entities/user_entity.dart';
import 'package:my_chat/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecureStorageService secureStorageService;

  AuthRepositoryImpl(this.remoteDataSource, this.secureStorageService);

  @override
  Future<UserEntity> login(String email, String password) async {
    final response = await remoteDataSource.login(email, password);
    
    // Assuming the response body has a specific structure
    final accessToken = response.data['access_token'] as String;
    final refreshToken = response.data['refresh_token'] as String;
    
    await secureStorageService.saveTokens(accessToken, refreshToken);
    
    final userJson = response.data['user'];
    return UserEntity.fromMap(userJson);
  }

  @override
  Future<void> logout() async {
    await secureStorageService.deleteAllTokens();
  }
  
  @override
  Future<String> refreshToken() async {
    final refreshToken = await secureStorageService.getRefreshToken();
    if (refreshToken == null) {
      throw Exception('No refresh token found');
    }
    
    final response = await remoteDataSource.refreshToken(refreshToken);
    final newAccessToken = response.data['access_token'] as String;
    
    await secureStorageService.saveToken("access_token", newAccessToken);
    
    return newAccessToken;
  }
}