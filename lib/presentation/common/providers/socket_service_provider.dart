import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/data/service/socket_service.dart';

final socketServiceProvider = Provider<SocketService>((ref) {
  return SocketService(ref);
});