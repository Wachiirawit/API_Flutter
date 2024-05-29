import 'package:flutter/material.dart';
import 'package:flutter_api/dataprovider/data_provider.dart';
import 'package:flutter_api/models/article_model.dart';
import 'package:flutter_api/screens/Article_detail.screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleApiPage extends ConsumerWidget {
  const ArticleApiPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _article = ref.watch(articleDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article_API'),
        backgroundColor: Colors.blue[400],
      ),
      body: _article.when(
          data: (_article) {
            List<ArticleModel> articleList = _article.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: articleList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ArticleDetailScreen(
                                    e: articleList[index],
                                    ),
                                    ),
                              ),

                              child: Card(
                              color: Colors.blue,
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              
                              child: ListTile(
                                
                                title: Text(
                                  articleList[index].title,
                                  style: const TextStyle(color: Colors.white),
                                ),

                                
              
                                subtitle: Text(
                                  articleList[index].date ,
                                  style: const TextStyle(
                                  color: Colors.white
                                ),),
                                trailing: CircleAvatar(
                                  backgroundImage: NetworkImage(articleList[index].image),
                                ),
              
                              ),
                            ));
                          }))
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
