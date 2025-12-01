import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:my_chat/core/secure_storage_service.dart';
import 'package:my_chat/data/datasource/auth_remote_data_source.dart';
import 'package:my_chat/data/repository/auth_repository_impl.dart';
import 'package:my_chat/domain/entities/user_entity.dart';
import 'package:my_chat/domain/use_cases/login_usecase.dart';
import 'package:my_chat/domain/use_cases/logout_usecase.dart';

// Store the datasourse - repository - usecases - state management in one file for simplicity
// 1. Providers for Services & Repositories
final secureStorageServiceProvider = Provider((ref) => SecureStorageService());

final dioProvider = Provider((ref) => Dio(BaseOptions(
  baseUrl: 'http://192.168.43.79:3000/',
)));

final authRemoteDataSourceProvider = Provider((ref) => AuthRemoteDataSource(
  ref.watch(dioProvider), // watch because if dio option changes, authRemoteDataSource should update
));

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(
  ref.read(authRemoteDataSourceProvider),
  ref.read(secureStorageServiceProvider),
));

// 2. Providers for Use Cases
final loginUseCaseProvider = Provider((ref) => LoginUseCase(
  ref.read(authRepositoryProvider),
));

final logoutUseCaseProvider = Provider((ref) => LogoutUseCase(
  ref.read(authRepositoryProvider),
));

// 3. State Management
enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final UserEntity? user;
  final String? errorMessage;

  AuthState({
    required this.status,
    this.user,
    this.errorMessage,
  });
}

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthNotifier(this._loginUseCase, this._logoutUseCase)
    : super(AuthState(status: AuthStatus.initial));

  Future<void> login(String email, String password) async {
    state = AuthState(status: AuthStatus.loading);
    try {
      final user = await _loginUseCase.execute(email, password);
      
      state = AuthState(status: AuthStatus.authenticated, user: user);
      print("Auth status");
      print(state.status);
    } catch (e) {
      print("Login error: $e");
      state = AuthState(status: AuthStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> logout() async {
    state = AuthState(status: AuthStatus.loading);
    await _logoutUseCase.execute();
    state = AuthState(status: AuthStatus.unauthenticated);
    // should redirect to login page after logout
    
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  final logoutUseCase = ref.watch(logoutUseCaseProvider);
  return AuthNotifier(loginUseCase, logoutUseCase);
});