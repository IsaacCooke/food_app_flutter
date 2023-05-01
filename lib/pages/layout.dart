import 'package:flutter/material.dart';

import 'package:food_app_flutter/pages/challenge.dart';
import 'package:food_app_flutter/pages/history.dart';
import 'package:food_app_flutter/pages/home.dart';

class Layout extends StatefulWidget{
  const Layout({super.key});

  @override
  State<Layout> createState() => LayoutState();
}

class LayoutState extends State<Layout>{
  int _selectedIndex = 0;

  static const List<Widget> _options = <Widget>[
    HomePage(),
    HistoryPage(),
    ChallengePage(),
    // All of these text widgets need to be replaced by the necessary page widgets.
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: _options.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "History",
          ),
          BottomNavigationBarItem(
            label: "Challenge",
            icon: Icon(Icons.emoji_events),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}