import 'package:flutter_api/models/user_model.dart';
import 'package:flutter_api/services/sevices.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userPovider).getUser();
});
