import 'package:flutter/material.dart';
import 'package:flutter_api/models/user_model.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key, required this.e});
  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(e.avatar),
              ),
            ),
            Text(
              e.firstname + " " + e.lastname,
              ),
            Text(e.email)

        ],),
      ),
    );
  }
}
