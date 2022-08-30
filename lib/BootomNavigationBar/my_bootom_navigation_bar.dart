import 'package:flutter/material.dart';
import 'package:hello_world/BootomNavigationBar/Pages/camera_page.dart';
import 'package:hello_world/BootomNavigationBar/Pages/history_page.dart';
import 'package:hello_world/BootomNavigationBar/Pages/home_page.dart';
import 'package:hello_world/BootomNavigationBar/Pages/store_page.dart';
import 'package:hello_world/BootomNavigationBar/Pages/wallet_page.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentPosition = 0;

  var pegesList = [
    HomePage(),
    StorePage(),
    CameraPage(),
    WalletPage(),
    HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pegesList[_currentPosition],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store"),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Camera"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
        currentIndex: _currentPosition,
        onTap: (index) {
          setState(() {
            _currentPosition = index;
          });
        },
      ),
    );
  }
}
