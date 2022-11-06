import 'package:audio_player_demo/providers/models/MusicViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (BuildContext context) => MusicViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  HomeScreen(),
      ),
    );
  }
}

