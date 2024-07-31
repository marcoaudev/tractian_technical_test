import 'package:flutter/material.dart';
import 'package:tractian_technical_test/features/ui/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(23, 25, 45, 1), // Defina aqui a cor desejada para a AppBar
        ),
      ),
      home: const HomePage(),
    );
  }
}