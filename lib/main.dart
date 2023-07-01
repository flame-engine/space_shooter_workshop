import 'package:flutter/material.dart';
import 'package:space_shooter_workshop/title_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      home: TitleScreen(),
    ),
  );
}
