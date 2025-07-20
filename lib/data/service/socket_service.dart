import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/presentation/chat/state/message_provider.dart';
import 'package:my_chat/types/message.dart';
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

    socket.on('receiveMessage', (data) {
      print('New message: $data');

      ref.read(messagesProvider.notifier).addMessage(
        Message(
          senderId: data['senderId'],
          senderName: data['senderName'],
          content: data['content'],
          timestamp: DateTime.now(),
        ),
      );
    });
  }

  void sendMessage(Message message) {
    
    socket.emit('sendMessage', message.toJson());
  }
}
