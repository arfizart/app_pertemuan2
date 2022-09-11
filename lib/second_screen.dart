import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
            Text("Arfi Zulfiansyah"),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.pop(context);
              },
              label: const Text("Home"),
              tooltip: 'Back',
              icon: const Icon(Icons.home_filled),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
