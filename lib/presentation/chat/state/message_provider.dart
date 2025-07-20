import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/types/message.dart';

final messagesProvider = StateNotifierProvider<MessagesNotifier, List<Message>>((ref) {
  return MessagesNotifier();
});

class MessagesNotifier extends StateNotifier<List<Message>> {
  MessagesNotifier() : super([]);

  void addMessage(Message message) {
    state = [...state, message];
  }
}
