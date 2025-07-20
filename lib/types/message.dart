// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  final String senderId;
  final String senderName;
  final String content;
  DateTime? timestamp;

  Message({
    required this.senderId,
    required this.senderName,
    required this.content,
    this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'senderName': senderName,
      'content': content,
      'timestamp': timestamp?.toIso8601String(), // Optional
    };
  }
}
