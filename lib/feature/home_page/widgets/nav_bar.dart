import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/extensions/sizes_extensions.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        buildNavBarItem(context, "Anasayfa", "assets/icons/home.svg"),
        buildNavBarItem(context, "Dashboard", "assets/icons/ranking.svg"),
        buildNavBarItem(context, "Formlar", "assets/icons/firstline.svg"),
        buildNavBarItem(context, "Görevler", "assets/icons/category-2.svg"),
        buildNavBarItem(context, "Ayarlar", "assets/icons/setting-2.svg"),
      ],
    );
  }

  BottomNavigationBarItem buildNavBarItem(
      BuildContext context, String label, String iconPath) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(bottom: context.lowValue.h),
          child: SvgPicture.asset(iconPath),
        ),
        label: label);
  }
}
