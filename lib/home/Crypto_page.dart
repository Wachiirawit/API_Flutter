import 'package:flutter/material.dart';
import 'package:flutter_api/dataprovider/data_provider.dart';
import 'package:flutter_api/models/crypto_model.dart';
import 'package:flutter_api/screens/Cryto_Detail.scren.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CryptoApiPage extends ConsumerWidget {
  const CryptoApiPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _datacrypto = ref.watch(cryptoDataProdvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto_API'),
        backgroundColor: Colors.blue,
      ),
      body: _datacrypto.when(
          data: (_datacrypto) {
            List<CryptoModel> cryptoList = _datacrypto.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: cryptoList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CryptoDetailScreen(
                                    e: cryptoList[index],
                                    ),
                                    ),
                              ),

                              child: Card(
                              color: Colors.blue,
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              
                              child: ListTile(
                                
                                title: Text(
                                  cryptoList[index].name,
                                  style: const TextStyle(color: Colors.white),
                                ),

                                
              
                                subtitle: Text("${cryptoList[index].price}  Dollar", style: const TextStyle(
                                  color: Colors.white
                                ),),
                                trailing: CircleAvatar(
                                  backgroundImage: NetworkImage(cryptoList[index].image),
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
