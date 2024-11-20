import 'package:flutter/material.dart';
import 'package:shared_prifference_flutter/view/home_screen.dart/home_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}