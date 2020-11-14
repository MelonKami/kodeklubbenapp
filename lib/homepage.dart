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
    Text('test'),
    Chat()
  ]; //HomePage(), Chat(title: 'Felles Chat')];

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'Kodeklubben',
      //theme: ThemeData(primarySwatch: Colors.black),
      home: Scaffold(
        backgroundColor: Colors.grey[800],
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
                backgroundColor: Colors.black)
          ],
        ),
      ),
    );
  }
}
//             Column(children: [
//               FlatButton(
//                 child: Text(
//                   'Chat',
//                 ),
//                 color: Colors.grey,
//                 onPressed: () {
//                   Navigator.push(
//                     ctx,
//                     MaterialPageRoute(
//                       builder: (ctx) => Chat(
//                         title: 'Kodeklubben',
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               FlatButton(
//                 child: Text('Kalender | IKKE KLAR'),
//                 color: Colors.grey,
//                 onPressed: () {
//                   Navigator.push(
//                       ctx, MaterialPageRoute(builder: (ctx) => Calendar()));
//                 },
//               ),
//               FlatButton(
//                 child: Text(
//                   'Logg inn/registrer',
//                 ),
//                 color: Colors.grey,
//                 onPressed: () {
//                   Navigator.push(
//                       ctx, MaterialPageRoute(builder: (ctx) => LoggInn()));
//                 },
//               )
//             ])));
//   }
// }
