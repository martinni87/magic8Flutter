import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(20, 20, 20, 0.8),
        appBar: AppBar(
          title: const Center(child: Text("Bola 8")),
          backgroundColor: Colors.black26,
        ),
        body: Bola8App(),
      ),
    ),
    // child: Bola8App(),
  );
}

class Bola8App extends StatefulWidget {
  const Bola8App({Key? key}) : super(key: key);

  @override
  State<Bola8App> createState() => _Bola8AppState();
}

class _Bola8AppState extends State<Bola8App> {
  /**
   * El siguiente comido que aparece comentado es para añadir un detector
   * para saber si el móvil es agitado por el usuario (documentación oficial).
   * Por algún motivo no me resulta posible añadir la librería package:shake/shake.dart
   * por lo que el código queda comentado y de momento la aplicación funciona al tocar
   * la pantalla.
   */
  // @override
  // void initState() {
  //   super.initState();
  //   ShakeDetector detector = ShakeDetector.autoStart(
  //     onPhoneShake: () {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Shake!'),
  //         ),
  //       );
  //       // Do stuff on phone shake
  //     },
  //     minimumShakeCount: 1,
  //     shakeSlopTimeMS: 500,
  //     shakeCountResetTime: 3000,
  //     shakeThresholdGravity: 2.7,
  //   );
  //
  //   // To close: detector.stopListening();
  //   // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  // }

  /**
   * A partir de aquí código para funcionamiento de la app tocando la pantalla.
   */
  var randomNumber = 0;
  var textToShow = "";

  static const List<String> messages = [
    "Sí",
    "No",
    "No sabría\ndecirte",
    "Sólo sé que\nno sé nada",
    "Nada más\nalejado de\nla realidad",
    "¡Hakuna\nMatata!"
  ];

  void changeBallMsg() {
    setState(() {
      var previousNum = randomNumber;
      randomNumber = Random().nextInt(5) + 0;
      print("Valores: $previousNum/$randomNumber");
      if (randomNumber == previousNum) {
        if (randomNumber >= 5) {
          randomNumber = 1;
        } else {
          randomNumber++;
        }
      }
      textToShow = messages[randomNumber];
      print("Palabra a mostrar: $textToShow \n");
      print("Valor random: $randomNumber \n");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black26,
        image: DecorationImage(
          image: AssetImage("images/ball0.png"),
          scale: 0.9,
        ),
      ),
      child: TextButton(
        onPressed: () {
          changeBallMsg();
        },
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            textToShow,
            style: const TextStyle(
              color: Colors.tealAccent,
              fontSize: 20,
              fontWeight: FontWeight.w300,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}
