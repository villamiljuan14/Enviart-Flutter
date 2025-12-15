import 'package:flutter/material.dart';
import 'data/app_colors.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enviart - Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PantallaInicio(),
      debugShowCheckedModeBanner: false,
    );
  }
}