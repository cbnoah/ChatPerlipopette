import 'package:chatperlipopette/pages/home.dart';
import 'package:chatperlipopette/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    _audioPlayer = AudioPlayer ();
    await _audioPlayer.setAsset('assets/sounds/Moew.mp3');
    await _audioPlayer.play();
  }


  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  final _pages = const <Widget>[
    Home(),
    Search(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Chats'),
        ],
      ),
    );
  }
}
