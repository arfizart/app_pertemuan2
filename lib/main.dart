import 'package:app_pertemuan2/bmi_result.dart';
import 'package:app_pertemuan2/bmi_screen.dart';
import 'package:app_pertemuan2/home.dart';
import 'package:app_pertemuan2/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

Widget myappBar = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: const [Text("BMI Calculator")],
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.calculate),
          title: myappBar,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage("https://picsum.photos/200"),
                ),
              ),
            ),
          ],
        ),
        body: const BmiScreen(),
        // bottomNavigationBar: _BottomAppBar(),
      ),
    );
  }
}

class _BottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 1,
      color: Colors.green,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 20),
              icon: const Icon(
                Icons.home_filled,
                size: 30,
              ),
              onPressed: () async {},
            ),
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 50),
              icon: const Icon(
                Icons.calculate,
                size: 30,
              ),
              onPressed: () async {},
            ),
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 20),
              icon: const Icon(
                Icons.person,
                size: 30,
              ),
              onPressed: () async {
                await Flushbar(
                  title: 'Klik Profile',
                  message: 'Anda mengklik icon profile',
                  duration: Duration(seconds: 1),
                ).show(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SecondScreen(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
