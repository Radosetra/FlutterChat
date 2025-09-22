class UserEntity {
  final String id;
  final String name;
  final String email;
  final bool isConnected;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.isConnected,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      isConnected: map['isConnected'] ?? false,
    );
  }
}