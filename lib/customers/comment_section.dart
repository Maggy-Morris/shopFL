import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'comment_model.dart'; // Import your Comment model here

class CommentSection extends StatefulWidget {
  final String shopId;

  CommentSection({super.key, required this.shopId});

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  bool _showBottomBar = false;
  final TextEditingController _commentController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _toggleBottomBar() {
    setState(() {
      _showBottomBar = !_showBottomBar;
    });
  }

  Future<void> _addComment(String content) async {
    await _firestore.collection('customers_comments').add({
      'shopId': widget.shopId,
      'userName': 'mora', // Replace with the actual user name
      'content': content,
      'timestamp': Timestamp.now(),
    });
    _commentController.clear();
    _toggleBottomBar();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: _firestore
              .collection('customers_comments')
              .where('shopId', isEqualTo: widget.shopId)
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No comments yet.'));
            }

            List<Comment> comments = snapshot.data!.docs
                .map((doc) => Comment.fromFirestore(doc))
                .toList();

            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: comments.length,
              itemBuilder: (context, index) {
                Comment comment = comments[index];
                return GestureDetector(
                  onTap: _toggleBottomBar,
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 3.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffF0F5FA),
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                  color: Color(0xffD2D5F9),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      comment.userName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(comment.content),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.thumb_up),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.comment),
                                    onPressed: _toggleBottomBar,
                                  ),
                                ],
                              ),
                              Text(TimeAgo.timeAgoSinceDate(
                                  comment.timestamp.toDate())),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        if (_showBottomBar)
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _addComment(_commentController.text.trim());
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class TimeAgo {
  static String timeAgoSinceDate(DateTime date) {
    final currentDate = DateTime.now();
    final difference = currentDate.difference(date);

    if (difference.inDays > 8) {
      return DateFormat('dd/MM/yyyy').format(date);
    } else if ((difference.inDays / 7).floor() >= 1) {
      return '${(difference.inDays / 7).floor()} week(s) ago';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return '1 day ago';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return '1 hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return '1 minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
