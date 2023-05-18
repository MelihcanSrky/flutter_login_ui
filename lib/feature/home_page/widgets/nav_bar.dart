import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        buildNavBarItem("Anasayfa", "assets/icons/home.svg"),
        buildNavBarItem("Dashboard", "assets/icons/ranking.svg"),
        buildNavBarItem("Formlar", "assets/icons/firstline.svg"),
        buildNavBarItem("Görevler", "assets/icons/category-2.svg"),
        buildNavBarItem("Ayarlar", "assets/icons/setting-2.svg"),
      ],
    );
  }

  BottomNavigationBarItem buildNavBarItem(String label, String iconPath) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(bottom: Dimens.margin_8.h),
          child: SvgPicture.asset(iconPath),
        ),
        label: label);
  }
}
