import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFf4ece3),
        body: Center(
          child: Column(
            children: [
              Image.asset('images/logo_kginger.png'),
            ],
          ),
        ),
      ),
    );
  }
}
