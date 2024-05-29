import 'dart:async';
import 'dart:convert';

import 'package:flutter_api/models/crypto_model.dart';
import 'package:flutter_api/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';



class ApiUser {
  String endpoint = 'https://reqres.in/api/users?page=2';
  // String endpoint = 'https://dev.to/api/articles';

  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];

      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class CryptoApi {
  String cryptoUri = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
  // String cryptoUri = 'https://jsonplaceholder.typicode.com/posts';
  // String cryptoUri = 'https://reqres.in/api/users?page=1';

  Future<List<CryptoModel>> getCrypto() async {
    Response response = await get(Uri.parse(cryptoUri));
    if (response.statusCode == 200) {
      // final List result = jsonDecode(response.body)['data'];
       List<dynamic> result = jsonDecode(response.body);

      return result.map(((e) => CryptoModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}


final userProvider = Provider<ApiUser>((ref) => ApiUser());
final userString = Provider<String>((ref) => 'Hi');

final cryptoProvider = Provider<CryptoApi>((ref) => CryptoApi());
final crytoString = Provider<String>((ref) => 'Hi');
