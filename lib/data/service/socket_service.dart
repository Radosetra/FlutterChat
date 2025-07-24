import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/presentation/chat/state/message_provider.dart';
import 'package:my_chat/presentation/common/providers/user_state_provider.dart';
import 'package:my_chat/types/message.dart';
import 'package:my_chat/types/user.dart';
import 'package:my_chat/utils/generate_roomid.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;
  final Ref ref;

  SocketService(this.ref);

  void connect() {
    socket = IO.io('http://localhost:3000', {
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.on('connect', (_) {
      print('Connected to backend!');
    });

    socket.on('activeUsers', (data) {
      final users = (data as List).map((u) => User.fromJson(u)).toList();
      ref.read(userProvider.notifier).setActiveUsers(users);
    });
  }

  void joinActifUsers(User user){
    socket.emit('join', user.toJson());
  }

  void sendMessage(Message message) {
    socket.emit('sendMessage', message.toJson());
  }

  void joinRoom(String userA, String userB) {
    final roomId = generateRoomId(userA, userB);
    socket.emit('joinRoom', roomId);
    socket.off('receiveMessage');
    socket.on('receiveMessage', (data) {
      print('New message: $data');

      ref.read(messagesProvider.notifier).addMessage(
        Message(
          senderId: data['senderId'],
          senderName: data['senderName'],
          content: data['content'],
          roomId: data['roomId'],
          timestamp: DateTime.now(),
        ),
      );
    });
  }
}
