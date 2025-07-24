import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/types/user.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState());

  void setCurrentUser(User user) {
    state = state.copyWith(currentUser: user);
  }

  void setActiveUsers(List<User> users) {
    state = state.copyWith(activeUsers: users);
  }

  void clearCurrentUser() {
    state = state.copyWith(currentUser: null);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});


