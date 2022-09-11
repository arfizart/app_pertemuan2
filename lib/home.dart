import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';

class myHome extends StatelessWidget {
  const myHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            height: 250,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage("https://picsum.photos/200"),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: InvertColors(
                    child: Image(
                      alignment: Alignment.center,
                      image: AssetImage("assets/images/logo.png"),
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
          ),
          Text(
            "Halo, Selamat Datang!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
