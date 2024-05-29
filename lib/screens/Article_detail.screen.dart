
import 'package:flutter/material.dart';
import 'package:flutter_api/models/article_model.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key, required this.e});
  final ArticleModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(e.image),
              ),
            ),
            Text(
              e.title 
              ),
            Text(e.description)
          //  Text(e.price.toString())
        ],),
      ),
    );
  }
}
