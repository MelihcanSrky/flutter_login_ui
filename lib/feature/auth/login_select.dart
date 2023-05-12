import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/feature/auth/login.dart';
import 'package:flutter_netigma_login/feature/auth/select_corp.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/CustomButton.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/CustomTextField.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/LoginDesc.dart';
import 'package:flutter_netigma_login/res/colors.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_netigma_login/res/strings.dart';
import 'package:flutter_netigma_login/res/typography.dart';

class LoginSelectPage extends StatelessWidget {
  const LoginSelectPage({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: Dimens.marginDefault),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: _height * 0.1,
                      ),
                      Image.asset(
                        "assets/images/netigma-logo.png",
                        height: Dimens.margin_48,
                      ),
                      SizedBox(
                        height: Dimens.margin_16,
                      ),
                      LoginDesc(descText: Strings.loginSelectDesc),
                      SizedBox(
                        height: Dimens.margin_24,
                      ),
                      CustomTextField(
                        labelText: Strings.selectCorpToLogin,
                        prefixIcon: AssetImage("assets/icons/buildings-2.png"),
                        suffixIcon:
                            AssetImage("assets/icons/arrow-circle-right.png"),
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
                        height: Dimens.margin_8,
                      ),
                      CustomDividerWithText(text: "ya da"),
                      SizedBox(
                        height: Dimens.margin_8,
                      ),
                      CustomTextField(
                        labelText: Strings.corpCodeToLogin,
                        prefixIcon: AssetImage("assets/icons/code-circle.png"),
                      ),
                      SizedBox(
                        height: Dimens.margin_8,
                      ),
                      CustomDividerWithText(text: "ya da"),
                      SizedBox(
                        height: Dimens.margin_8,
                      ),
                      CustomTextField(
                        labelText: Strings.corpAdressToLogin,
                        prefixIcon:
                            AssetImage("assets/icons/global-search.png"),
                        suffixIcon: AssetImage("assets/icons/scan-barcode.png"),
                      ),
                      SizedBox(
                        height: Dimens.margin_24,
                      ),
                      CustomButton(
                        onPressed: () {},
                        text: Strings.continueText,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Dimens.margin_18),
                    child: Image.asset("assets/images/netcad-logo.png"),
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
    return Positioned(
      child: Image.asset(
        "assets/images/login-select-bg.png",
        fit: BoxFit.contain,
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
          child: Divider(
            height: 2,
            thickness: 1,
            color: CustomColors.dividerGrey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(Dimens.margin_10),
          child: Text(
            text,
            style:
                CustomTypography.h5_regular.copyWith(color: Color(0xFF232323)),
          ),
        ),
        Expanded(
          child: Divider(
            height: 2,
            thickness: 1,
            color: CustomColors.dividerGrey,
          ),
        ),
      ],
    );
  }
}
