import 'package:flutter/material.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/asset_page.dart';
import 'package:tractian_technical_test/features/ui/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(23, 25, 45, 1),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 25)),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/asset": (context) => const AssetPage(),
      },
    );
  }
}
