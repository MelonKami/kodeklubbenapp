import 'package:flutter/material.dart';
import 'package:kodeklubben/chat.dart';
import 'package:kodeklubben/logginn.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final List<Widget> _pageOptions = [
    Text('Her blir det en hjemmeside med kode relevante informasjoner'),
    Chat(),
    LoggInn()
  ]; //HomePage(), Chat(title: 'Felles Chat')];

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'Kodeklubben',
      //theme: ThemeData(primarySwatch: Colors.black),
      home: Scaffold(
        //backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text('Kodeklubben!'),
          backgroundColor: Colors.black,
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          showUnselectedLabels: true,
          selectedFontSize: 16,
          unselectedItemColor: Colors.grey[350],
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Hjemmeside',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.login),
                label: 'Logg inn med google',
                backgroundColor: Colors.yellow)
          ],
        ),
      ),
    );
  }
}
