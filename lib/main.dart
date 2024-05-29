import 'package:flutter/material.dart';
import 'package:flutter_api/home/Crypto_page.dart'; 
import 'package:flutter_api/home/User_Page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApi',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),

      home: const MyApi(),
    );
  }
}

class MyApi extends StatefulWidget {
  const MyApi({super.key});

  @override
  _MyApiState createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {
  // int _currentIndex = 0;
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const UserApiPage(),
    const CryptoApiPage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.airport_shuttle_rounded),
            label: 'UserApi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'CryptoApi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}































// //save

// void main() {
//   // runApp(const MyApp());
//   runApp(ProviderScope(child: MyApp()));

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // home: const MyHomePage(),
//       home: const BottomNavigationBarExample(),

//     );
//   }
// }



