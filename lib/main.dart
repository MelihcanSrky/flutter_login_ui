import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/feature/auth/login_select.dart';
import 'package:flutter_netigma_login/res/colors.dart';

import 'feature/auth/login.dart';
import 'feature/auth/select_corp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SelectCorpPage(),
        ),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: CustomColors.primaryBlue)),
      ),
    );
  }
}
