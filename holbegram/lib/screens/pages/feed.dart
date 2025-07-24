import 'package:flutter/material.dart';
import 'package:holbegram/utils/posts.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Holbegram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 32,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.add),
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.message),
          ),
        ],
      ),
      body: const Posts(),
    );
  }
}
