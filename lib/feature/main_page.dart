import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/feature/home_page/home_page.dart';
import 'package:flutter_netigma_login/feature/home_page/widgets/nav_bar.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: Material(
        shadowColor: Theme.of(context).shadowColor,
        elevation: 4,
        child: Container(
          height: Dimens.margin_84.h,
          child: NavBar(),
        ),
      ),
    );
  }
}
