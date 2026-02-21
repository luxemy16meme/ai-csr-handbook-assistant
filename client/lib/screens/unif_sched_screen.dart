import 'package:flutter/material.dart';

void main() {
  runApp(UnifSchedScreen());
}

class UnifSchedScreen extends StatelessWidget {
  const UnifSchedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text("Uniform Sched"))),
    );
  }
}
