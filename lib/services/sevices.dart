import 'dart:convert';

import 'package:flutter_api/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

// class ApiServices {
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
  
}


// final userPovider = Provider<ApiServices>((ref) => ApiServices());
final userPovider = Provider<ApiUser>((ref) => ApiUser());
final userString = Provider<String>((ref) => 'Hi');
