import 'dart:async';
import 'package:my_chat/core/socket_service.dart';
import 'package:my_chat/domain/entities/user_entity.dart';

class UserRemoteDataSource {
  final SocketService socketService;

  UserRemoteDataSource(this.socketService);

  // A StreamController to push new messages to the Domain/Presentation layers
  final _userController = StreamController<UserEntity>.broadcast();
  Stream<UserEntity> get userStream => _userController.stream;

  void connectUser() {
    // 1. Connect the socket
    socketService.connect(); 

    socketService.on('user.connected', (data) {
      try {
        // Parse the raw socket data into a Domain Entity
        final user = UserEntity.fromMap(data);
        _userController.sink.add(user);
      } catch (e) {
        print('Error parsing user when connecting: $e');
      }
    });
  }
  
  void dispose() {
    socketService.disconnect();
    _userController.close();
  }
}