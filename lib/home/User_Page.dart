import 'package:flutter/material.dart';
import 'package:flutter_api/dataprovider/data_provider.dart';
import 'package:flutter_api/models/user_model.dart';
import 'package:flutter_api/screens/User_Detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserApiPage extends ConsumerWidget {
  const UserApiPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User_API'),
        backgroundColor: Colors.blue[300],
      ),
      body: _data.when(
          data: (_data) {
            List<UserModel> userList = _data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => UserDetailScreen(
                                    e: userList[index],
                                    ),
                                    ),
                              ),

                              child: Card(
                              color: Colors.blue,
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              
                              child: ListTile(
                                
                                title: Text(
                                  userList[index].firstname,
                                  style: const TextStyle(color: Colors.white),
                                ),
              
                                subtitle: Text(userList[index].lastname, style: const TextStyle(
                                  color: Colors.white
                                ),),
                                trailing: CircleAvatar(
                                  backgroundImage: NetworkImage(userList[index].avatar),
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
