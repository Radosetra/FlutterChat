import 'package:my_chat/domain/entities/user_entity.dart';

abstract class UserRepository {
  Stream<UserEntity> get connectedUser;

  void connectUser();
}