import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica1/pages/home_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:practica1/pages/login_page.dart';
import 'package:practica1/pages/onboarding_screen.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//     return MaterialApp(
//       title: 'Little Nightmares Universe',
//       theme: ThemeData.dark(),
//       home: const HomePageProtagonists(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

// class _MyAppState extends State<MyApp> {
//   late AudioPlayer _audioPlayer;

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer();
//     _playBackgroundMusic();
//   }

//   Future<void> _playBackgroundMusic() async {
//     try {
//       await _audioPlayer.play(
//         AssetSource('Little Nightmares II (Main Theme).mp3'),
//       );
//       print('Background music started playing');
//     } catch (e) {
//       print('Error playing background music: $e');
//     }
//   }

//   @override
//   void dispose() {
//     _audioPlayer.stop();
//     _audioPlayer.release();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//     return MaterialApp(
//       title: 'Little Nightmares Universe',
//       theme: ThemeData.dark(),
//       home: const HomePageProtagonists(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    WidgetsBinding.instance
        .addObserver(this); // Agrega el observador de ciclo de vida
    _playBackgroundMusic();
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.release();
    WidgetsBinding.instance
        .removeObserver(this); // Elimina el observador de ciclo de vida
    super.dispose();
  }

  Future<void> _playBackgroundMusic() async {
    try {
      await _audioPlayer.play(
        AssetSource('Little Nightmares II (Main Theme).mp3'),
      );
      print('Background music started playing');
    } catch (e) {
      print('Error playing background music: $e');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // La aplicación volvió al primer plano, puedes reiniciar la música aquí
      _playBackgroundMusic();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'Little Nightmares Universe',
      theme: ThemeData.dark(),
      home: const LoginPage(),
      routes: {
        "/home": (BuildContext context) => HomePageProtagonists(),
        "/on_boarding": (BuildContext context) => OnBoardingScreen()
      }, //HomePageProtagonists(),
      debugShowCheckedModeBanner: false,
    );
  }
}
