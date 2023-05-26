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
      resizeToAvoidBottomInset: false,
      body: SafeArea(top: false, child: HomePage()),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: Dimens.margin_4,
              offset: Offset(0, -Dimens.margin_4),
            ),
          ],
        ),
        alignment: Alignment.topCenter,
        height: Dimens.margin_84.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.margin_16.w),
          child: NavBar(),
        ),
      ),
    );
  }
}
