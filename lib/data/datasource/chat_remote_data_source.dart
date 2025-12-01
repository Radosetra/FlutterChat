import 'dart:async';
import 'package:my_chat/core/socket_service.dart';
import 'package:my_chat/domain/entities/user_entity.dart';
import 'package:my_chat/presentation/chat/state/message_provider.dart';
import 'package:my_chat/presentation/common/providers/user_state_provider.dart';
import 'package:my_chat/types/message.dart';
import 'package:my_chat/types/user.dart';
import 'package:my_chat/utils/generate_roomid.dart';

class ChatRemoteDataSource {
  final SocketService socketService;

  ChatRemoteDataSource(this.socketService);

  // A StreamController to push new messages to the Domain/Presentation layers
  // final _messageController = StreamController<MessageEntity>.broadcast();
  // Stream<MessageEntity> get messageStream => _messageController.stream;
  final _userController = StreamController<UserEntity>.broadcast();
  Stream<UserEntity> get messageStream => _userController.stream;

  void initializeApp() {
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

  // void initializeChat() {
  //   // 1. Connect the socket
  //   socketService.connect(); 

  //   // 2. Set up listener for 'new_message' event
  //   socketService.on('new_message', (data) {
  //     try {
  //       // Parse the raw socket data into a Domain Entity
  //       final message = MessageEntity.fromJson(data);
  //       _messageController.sink.add(message);
  //     } catch (e) {
  //       print('Error parsing message: $e');
  //     }
  //   });
  // }

  void sendMessage(String receiverId, String content) {
    // 3. Emit a structured event
    socketService.emit('send_message', {
      'receiverId': receiverId,
      'content': content,
    });
  }
  
  void dispose() {
    socketService.disconnect();
    _userController.close();
  }
}