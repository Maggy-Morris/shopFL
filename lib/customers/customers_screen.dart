import 'package:anwer_shop/constants/colors.dart';
import 'package:anwer_shop/customers/comment_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('عملائي'.tr()),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Image.asset(
                "assets/icon_images/Rectangle 556.png", // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye),
                      SizedBox(width: 4),
                      Text('200'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.thumb_up),
                      SizedBox(width: 4),
                      Text('250'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: MyColors.red,
                      ),
                      SizedBox(width: 4),
                      Text('500'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(width: 4),
                      Text('4.1'),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            CommentSection(
              shopId: firebaseAuth.currentUser!.uid,
            ),
          ],
        ),
      ),
    );
  }
}
