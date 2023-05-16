import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/feature/auth/select_corp.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/CustomButton.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/CustomTextField.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/LoginDesc.dart';
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
              padding: EdgeInsets.symmetric(horizontal: Dimens.marginDefault.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: Dimens.margin_88.h,
                      ),
                      Image.asset(
                        "assets/images/netigma-logo.png",
                        height: Dimens.margin_48.h,
                      ),
                      SizedBox(
                        height: Dimens.margin_16.h,
                      ),
                      LoginDesc(descText: Strings.loginSelectDesc),
                      SizedBox(
                        height: Dimens.margin_24.h,
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
                        height: Dimens.margin_8.h,
                      ),
                      CustomDividerWithText(text: "ya da"),
                      SizedBox(
                        height: Dimens.margin_8.h,
                      ),
                      CustomTextField(
                        labelText: Strings.corpCodeToLogin,
                        prefixIcon: "assets/icons/code-circle.svg",
                      ),
                      SizedBox(
                        height: Dimens.margin_8.h,
                      ),
                      CustomDividerWithText(text: "ya da"),
                      SizedBox(
                        height: Dimens.margin_8.h,
                      ),
                      CustomTextField(
                        labelText: Strings.corpAdressToLogin,
                        prefixIcon: "assets/icons/global-search.svg",
                        suffixIcon: "assets/icons/scan-barcode.svg",
                      ),
                      SizedBox(
                        height: Dimens.margin_24.h,
                      ),
                      CustomButton(
                        onPressed: () {},
                        text: Strings.continueText,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Dimens.margin_18.h),
                    child: Image.asset(
                      "assets/images/netcad-logo.png",
                      height: Dimens.margin_24.h,
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

class CustomDividerWithText extends StatelessWidget {
  final String text;
  const CustomDividerWithText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.margin_10.w),
            child: Divider(
              height: 2.h,
              thickness: 1.h,
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.margin_10.h),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).primaryColorDark),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.margin_10.w),
            child: Divider(
              height: 2.h,
              thickness: 1.h,
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
      ],
    );
  }
}
