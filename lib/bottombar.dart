     import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: Color.fromARGB(255, 198, 154, 24),
          useMaterial3: true,
          primaryColor: Color.fromARGB(255, 198, 154, 24)),
      home: const MynavigatorBar(),
    );
  }
}

class MynavigatorBar extends StatefulWidget {
  const MynavigatorBar({super.key});

  @override
  State<MynavigatorBar> createState() => _MynavigatorBarState();
}

class _MynavigatorBarState extends State<MynavigatorBar> {
  int _selectedindex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('people', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('scanner',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 154, 24),
        centerTitle: true,
        title: const Text(
          'bottombar demo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: _widgetOption.elementAt(_selectedindex),
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          // unselectedLabelStyle:
          // TextStyle(color: Color.fromARGB(255, 185, 76, 76)),
          unselectedIconTheme:
              IconThemeData(color: Color.fromARGB(255, 191, 233, 87)),
          selectedItemColor: Color.fromARGB(255, 31, 189, 166),
          selectedIconTheme:
              IconThemeData(color: Color.fromARGB(255, 31, 189, 166)),
          selectedLabelStyle:
              TextStyle(color: Color.fromARGB(255, 31, 189, 166)),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person'),
            BottomNavigationBarItem(icon: Icon(Icons.scanner), label: 'person'),
          ],
          currentIndex: _selectedindex,
          onTap: _onItemTapped, iconSize: 24,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 198, 154, 24),

          elevation: 5,
        ),
      ),
    ));
  }
}
