import 'package:flutter/material.dart';
import 'package:flutter_application_ai_handbook/screens/first_page.dart';
import 'package:flutter_application_ai_handbook/screens/chat_screen.dart';
import 'package:flutter_application_ai_handbook/screens/unif_sched_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/firstpage': (context) => FirstPage(),
        '/chatscreen': (context) => ChatScreen(),
        '/unifschedscreen': (context) => UnifSchedScreen(),
      },
    );
  }
}
