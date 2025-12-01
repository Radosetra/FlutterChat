import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/core/socket_service.dart';
import 'package:my_chat/presentation/common/providers/auth_provider.dart';

final socketServiceProvider = Provider((ref) => SocketService(
  ref.read(secureStorageServiceProvider),
));