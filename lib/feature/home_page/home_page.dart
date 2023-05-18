import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/custom_text_field.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_netigma_login/res/mock_data.dart';
import 'package:flutter_netigma_login/res/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      bottomNavigationBar: Material(
        shadowColor: Theme.of(context).shadowColor,
        elevation: 4,
        child: Container(
          height: Dimens.margin_84.h,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              buildNavBarItem("Anasayfa", "assets/icons/home.svg"),
              buildNavBarItem("Dashboard", "assets/icons/ranking.svg"),
              buildNavBarItem("Formlar", "assets/icons/firstline.svg"),
              buildNavBarItem("Görevler", "assets/icons/category-2.svg"),
              buildNavBarItem("Ayarlar", "assets/icons/setting-2.svg"),
            ],
          ),
        ),
      ),
      body: Stack(children: [
        buildBackgroundImage(_width),
        Container(
          child: Column(children: [
            SizedBox(
              height: Dimens.margin_68.h,
            ),
            Container(
              color: Theme.of(context).backgroundColor.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.margin_74, vertical: Dimens.margin_8),
                child: Row(children: [
                  Image.asset(
                    "assets/images/Ellipse-19.png",
                    height: Dimens.margin_70.h,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(
                    width: Dimens.margin_18.w,
                  ),
                  Expanded(
                    child: Text("Ankara Büyükşehir Belediyesi",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).primaryColorDark)),
                  )
                ]),
              ),
            ),
            SizedBox(
              height: Dimens.margin_18.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.margin_16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSearchTextField(),
                  Padding(
                    padding: EdgeInsets.only(top: Dimens.margin_10.h),
                    child: Text(
                      Strings.operations,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: Theme.of(context).primaryColorDark),
                    ),
                  ),
                  SizedBox(
                    height: Dimens.margin_16.h,
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: Dimens.margin_8.w,
                      mainAxisSpacing: Dimens.margin_8.h,
                    ),
                    itemCount: operationList.length,
                    itemBuilder: (context, index) {
                      return buildOperationsGridCards(context, index);
                    },
                  )
                ],
              ),
            )
          ]),
        )
      ]),
    );
  }

  Container buildOperationsGridCards(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.margin_16.h),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).shadowColor),
        borderRadius: BorderRadius.circular(Dimens.margin_6.r),
        color: Theme.of(context).backgroundColor,
      ),
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.margin_8.w, vertical: Dimens.margin_8.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.margin_8.r),
              color: Theme.of(context).cardColor),
          child: SvgPicture.asset(
            operationList[index]["iconPath"],
          ),
        ),
        SizedBox(
          height: Dimens.margin_8.h,
        ),
        Text(operationList[index]["label"],
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).primaryColorDark)),
      ]),
    );
  }

  Container buildBackgroundImage(double _width) {
    return Container(
      child: Image.asset(
        "assets/images/homepage-bg.png",
        fit: BoxFit.fitWidth,
        width: _width,
      ),
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

  Widget buildSearchTextField() {
    return Material(
      elevation: 2,
      shadowColor: Theme.of(context).dividerColor,
      borderRadius: BorderRadius.circular(Dimens.margin_64),
      child: CustomTextField(
        labelText: "Arama yapın...",
        prefixIcon: "assets/icons/search-outline.svg",
        borderRadius: 100,
        floatingLabelBehavior: false,
        prefixIconColor: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
