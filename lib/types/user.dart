class User {
  final String userId;
  final String userName;

  User({
    required this.userId,
    required this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      userName: json['userName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
    };
  }
}

class UserState {
  final User? currentUser;
  final List<User> activeUsers;

  UserState({
    this.currentUser,
    this.activeUsers = const [],
  });

  UserState copyWith({
    User? currentUser,
    List<User>? activeUsers,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
      activeUsers: activeUsers ?? this.activeUsers,
    );
  }
}
