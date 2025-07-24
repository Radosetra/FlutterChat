String generateRoomId(String? userId1, String? userId2) {
  if (userId1 == null || userId2 == null) {
    // throw ArgumentError('Both user IDs must be provided');
    return 'room-common';
  }
  return userId1.compareTo(userId2) < 0
      ? '$userId1-$userId2'
      : '$userId2-$userId1';
}