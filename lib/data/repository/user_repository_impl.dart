import 'package:my_chat/data/datasource/user_remote_data_source.dart';
import 'package:my_chat/domain/entities/user_entity.dart';
import 'package:my_chat/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Stream<UserEntity> get connectedUser => remoteDataSource.userStream;

  @override
  void connectUser() {
    remoteDataSource.connectUser();
  }

}