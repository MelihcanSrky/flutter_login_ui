import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/feature/auth/login_select.dart';
import 'package:flutter_netigma_login/notifier/provider_list.dart';
import 'package:flutter_netigma_login/theme/theme_notifer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ...ApplicationProvider.instance.dependItems,
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(390, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            home: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Center(
                child: LoginSelectPage(),
              ),
            ),
            theme: context.watch<ThemeNotifier>().currentTheme,
          );
        });
  }
}
