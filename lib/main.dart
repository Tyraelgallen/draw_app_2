import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble_test/draw_page.dart';
import 'package:scribble_test/escribe.dart';
import 'package:scribble_test/homescreen.dart';
import 'package:scribble_test/images.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scribble',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "home",
      routes: {
        "home": (context) => const HomeScreen(),
        "draw": (context) => DrawPage(
              list: vocales,
            ),
        "write": (context) => Escribe(
              objetos: objetos,
              audios: audios,
              nombres: nombres,
            ),
      },
    );
  }
}
