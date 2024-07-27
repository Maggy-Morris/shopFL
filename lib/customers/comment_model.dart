import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String shopId;
  final String userName;
  final String content;
  final Timestamp timestamp;

  Comment({
    required this.shopId,
    required this.userName,
    required this.content,
    required this.timestamp,
  });

  factory Comment.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Comment(
      shopId: data['shopId'],
      userName: data['userName'],
      content: data['content'],
      timestamp: data['timestamp'],
    );
  }
}
