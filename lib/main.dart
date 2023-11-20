import 'package:ebook_app/presentation/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EBookApp());
}

class EBookApp extends StatelessWidget {
  const EBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eBook',
      theme: const AppTheme().toThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
