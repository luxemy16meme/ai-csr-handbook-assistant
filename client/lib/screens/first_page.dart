import 'package:flutter/material.dart';
import 'package:flutter_application_ai_handbook/screens/admin_screen.dart';
import 'package:flutter_application_ai_handbook/screens/unif_sched_screen.dart';
import 'package:flutter_application_ai_handbook/screens/chat_screen.dart';

void main() {
  runApp(FirstPage());
}

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // keeps track of the current page to display
  int _selectedScreenIndex = 0;

  // this method updates the new selected index
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  // the screen pages we have in the app
  final List _screens = [
    // //chatscreen
    ChatScreen(),

    //uniform schedule
    UnifSchedScreen(),

    AdminScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("AskARSC", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 16, 55, 87),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/csr_logo.png', height: 50),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreenIndex,
          onTap: _navigateBottomBar,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Chatbot",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: "Uniform Schedule",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person_2), label: "Admin"),
          ],
        ),
        body: _screens[_selectedScreenIndex],
      ),
    );
  }
}
