import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/extensions/sizes_extensions.dart';
import 'package:flutter_netigma_login/feature/auth/select_corp.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/custom_button.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/divider_text.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/login_desc.dart';
import 'package:flutter_netigma_login/res/colors.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_netigma_login/res/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginSelectPage extends StatefulWidget {
  const LoginSelectPage({super.key});

  @override
  State<LoginSelectPage> createState() => _LoginSelectPageState();
}

class _LoginSelectPageState extends State<LoginSelectPage> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            buildBackgroundImage(),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: context.mediumValue.w + context.lowValue.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: context.mediumValue.h * 4,
                      ),
                      Image.asset(
                        "assets/images/netigma-logo.png",
                        height: context.highValue.h * 2,
                      ),
                      SizedBox(
                        height: context.normalValue.h,
                      ),
                      LoginDesc(descText: Strings.loginSelectDesc),
                      SizedBox(
                        height: context.highValue.h,
                      ),
                      CustomTextField(
                        labelText: Strings.selectCorpToLogin,
                        prefixIcon: "assets/icons/buildings-2.svg",
                        suffixIcon: "assets/icons/arrow-circle-right.svg",
                        suffixIconOnPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectCorpPage(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: context.lowValue.h,
                      ),
                      CustomDividerWithText(text: "ya da"),
                      SizedBox(
                        height: context.lowValue.h,
                      ),
                      CustomTextField(
                        labelText: Strings.corpCodeToLogin,
                        prefixIcon: "assets/icons/code-circle.svg",
                      ),
                      SizedBox(
                        height: context.lowValue.h,
                      ),
                      CustomDividerWithText(text: "ya da"),
                      SizedBox(
                        height: context.lowValue.h,
                      ),
                      CustomTextField(
                        labelText: Strings.corpAdressToLogin,
                        prefixIcon: "assets/icons/global-search.svg",
                        suffixIcon: "assets/icons/scan-barcode.svg",
                      ),
                      SizedBox(
                        height: context.highValue.h,
                      ),
                      CustomButton(
                        onPressed: () {},
                        text: Strings.continueText,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 18.h),
                    child: Image.asset(
                      "assets/images/netcad-logo.png",
                      height: context.highValue.h,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Positioned buildBackgroundImage() {
    double _width = MediaQuery.of(context).size.width;
    return Positioned(
      child: Image.asset(
        "assets/images/login-select-bg.png",
        fit: BoxFit.fitWidth,
        width: _width,
      ),
      bottom: 0,
    );
  }
}
