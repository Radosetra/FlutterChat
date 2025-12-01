import 'package:my_chat/core/secure_storage_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  final SecureStorageService _storageService;
  late IO.Socket socket;
  // final Ref ref;

  SocketService(this._storageService);

  Future<void> connect() async {
    final token = await _storageService.getAccessToken();
    if (token == null) {
      // Handle scenario where token is missing (e.g., user is logged out)
      return; 
    }

    socket = IO.io(
      "http://localhost:3000",
      IO.OptionBuilder()
        .setTransports(['websocket']) // Use WebSocket transport
        .enableForceNewConnection()
        .disableAutoConnect() // Manual connect
        .setExtraHeaders({'Authorization': 'Bearer $token'}) // Pass token
        .build(),
    );
    
    // Set up listeners for connection events
    socket.onConnect((_) => print('Socket Connected'));
    socket.onDisconnect((_) => print('Socket Disconnected'));
    socket.onError((error) => print('Socket Error: $error'));

    socket.connect();
  }

  // 2. Disconnect
  void disconnect() {
    socket.dispose();
  }

  // 3. Emit Data
  void emit(String event, dynamic data) {
    if (socket.connected) {
      socket.emit(event, data);
    }
  }

  // 4. Listen for Events
  void on(String event, Function(dynamic) handler) {
    socket.on(event, handler);
  }

  // socket.on('activeUsers', (data) {
    //   final users = (data as List).map((u) => User.fromJson(u)).toList();
    //   ref.read(userProvider.notifier).setActiveUsers(users);
    // });

  // void joinActifUsers(User user){
  //   socket.emit('join', user.toJson());
  // }

  // void sendMessage(Message message) {
  //   socket.emit('sendMessage', message.toJson());
  // }

  // void joinRoom(String userA, String userB) {
  //   final roomId = generateRoomId(userA, userB);
  //   socket.emit('joinRoom', roomId);
  //   socket.off('receiveMessage');
  //   socket.on('receiveMessage', (data) {
  //     print('New message: $data');

  //     ref.read(messagesProvider.notifier).addMessage(
  //       Message(
  //         senderId: data['senderId'],
  //         senderName: data['senderName'],
  //         content: data['content'],
  //         roomId: data['roomId'],
  //         timestamp: DateTime.now(),
  //       ),
  //     );
  //   });
  // }
}
