import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talha arif"),
        backgroundColor: Colors.amber,
      ),
      body: Center(child: Text("how are you")),
    );
  }
}
