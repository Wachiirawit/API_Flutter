import 'package:flutter_api/models/article_model.dart';
import 'package:flutter_api/models/crypto_model.dart';
import 'package:flutter_api/models/user_model.dart';
import 'package:flutter_api/services/sevices.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUser();
});

final cryptoDataProdvider = FutureProvider<List<CryptoModel>>((ref) async {
  return ref.read(cryptoProvider).getCrypto();
});

final articleDataProvider = FutureProvider<List<ArticleModel>>((ref) async {
  return ref.watch(articleProvider).getArticle();
});
