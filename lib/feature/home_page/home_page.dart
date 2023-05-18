import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/custom_text_field.dart';
import 'package:flutter_netigma_login/feature/home_page/widgets/operations_grid_card.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_netigma_login/res/mock_data.dart';
import 'package:flutter_netigma_login/res/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      childAspectRatio: 1.26,
                      crossAxisSpacing: Dimens.margin_8.w,
                      mainAxisSpacing: Dimens.margin_8.h,
                    ),
                    itemCount: operationList.length,
                    itemBuilder: (context, index) {
                      return OperationGridCard(
                          iconPath: operationList[index]["iconPath"],
                          label: operationList[index]["label"]);
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

  Container buildBackgroundImage(double _width) {
    return Container(
      child: Image.asset(
        "assets/images/homepage-bg.png",
        fit: BoxFit.fitWidth,
        width: _width,
      ),
    );
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
