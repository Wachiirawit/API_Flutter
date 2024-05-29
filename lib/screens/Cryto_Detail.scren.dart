
import 'package:flutter/material.dart';
import 'package:flutter_api/models/crypto_model.dart';

class CryptoDetailScreen extends StatelessWidget {
  const CryptoDetailScreen({super.key, required this.e});
  final CryptoModel e;

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
                backgroundImage: NetworkImage(e.image),
              ),
            ),
            Text(
              e.name 
              ),
            Text("${e.price} Dollar")
          //  Text(e.price.toString())
        ],),
      ),
    );
  }
}
