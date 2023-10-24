import 'package:bau_gdsc_101_event/features/get_x/all_characters_screen/all_characters_get_x_screen.dart';
import 'package:bau_gdsc_101_event/features/set_state/all_characters_screen_set_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BAU GDSC EVENT',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple.withOpacity(.5)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SelectionScreen(),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const AllCharacterScreenSetState())), child: const Text('Set State'),),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const AllCharactersGetxScreen())), child: const Text('Get X'),),
            ],
          ),
        ),
      ),
    );
  }
}