import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class Escribe extends StatefulWidget {
  const Escribe(
      {super.key,
      required this.objetos,
      required this.nombres,
      required this.audios});

  final List<String> objetos;
  final List<String> nombres;
  final List<String> audios;

  @override
  State<Escribe> createState() => _EscribeState();
}

class _EscribeState extends State<Escribe> {
  // Soundpool pool = Soundpool.fromOptions();

  @override
  void initState() {
    super.initState();
  }

  int currentPage = 0;

  void next() {
    if (currentPage + 1 < widget.objetos.length) {
      currentPage++;

      // setState(() {});
    }
  }

  void back() {
    if (currentPage != 0) {
      currentPage--;

      // setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Escucha, Observa y Escribe"),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: Container(
                width: size.width,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    widget.objetos[currentPage],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 0),
            child: SizedBox(
              width: size.width,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async {
                    _soundButton();
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    size: 50,
                  )),
              SizedBox(
                width: 15,
              )
            ],
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: "back2",
              tooltip: "Atras",
              onPressed: () {
                back();
                setState(() {});
              },
              child: const Icon(Icons.keyboard_double_arrow_left),
            ),
            const SizedBox(width: 75),
            FloatingActionButton(
              heroTag: "next2",
              tooltip: "Adelante",
              onPressed: () {
                next();
                setState(() {});
              },
              child: const Icon(Icons.keyboard_double_arrow_right),
            )
          ],
        ),
      ),
    );
  }

  void _soundButton() async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);
    int soundId = await rootBundle
        .load(
      "assets/audio/audio_a.mp3",
    )
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);

    // print("play");
  }
}
