import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home Screen'),
      ),
      body: Center(child: Text('THIS IS HOME !!!!!!!!!!!!!!!'),),
    );
  }
}
