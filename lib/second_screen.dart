import 'package:app_pertemuan2/main.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
            Text("Arfi Zulfiansyah")
          ],
        ),
      ),
    );
  }
}
