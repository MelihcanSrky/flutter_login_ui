import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/CustomButton.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/CustomTextField.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/LoginDesc.dart';
import 'package:flutter_netigma_login/res/colors.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_netigma_login/res/strings.dart';
import 'package:flutter_netigma_login/res/typography.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isRemember = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppbar(_height),
      body: Stack(
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
                        height: Dimens.margin_60,
                      ),
                      Text(
                        Strings.login,
                        style: CustomTypography.h3,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      LoginDesc(descText: Strings.loginDesc),
                      SizedBox(
                        height: Dimens.margin_24,
                      ),
                      CustomTextField(
                        labelText: Strings.userName,
                      ),
                      SizedBox(
                        height: Dimens.margin_12,
                      ),
                      CustomTextField(
                        labelText: Strings.password,
                        isPassword: true,
                      ),
                      buildRememberMe(),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      CustomButton(
                        onPressed: () {},
                        text: Strings.login,
                      ),
                    ]),
                buildPoweredBy()
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding buildPoweredBy() {
    return Padding(
      padding: const EdgeInsets.all(Dimens.margin_14),
      child: Text(
        Strings.poweredBy,
        style: CustomTypography.h6_regular,
      ),
    );
  }

  Positioned buildBackgroundImage() {
    return Positioned(
      child: Image.asset(
        "assets/images/illustration.png",
        fit: BoxFit.contain,
      ),
      bottom: 0,
    );
  }

  Row buildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.margin_8),
          child: Text(
            Strings.rememberMe,
            style: CustomTypography.h5_semibold.copyWith(
                color: CustomColors.primaryBlue, fontWeight: FontWeight.w500),
          ),
        ),
        Switch.adaptive(
            activeColor: CustomColors.primaryBlue,
            inactiveTrackColor: CustomColors.secondaryText,
            value: _isRemember,
            onChanged: (value) {
              setState(() {
                _isRemember = !_isRemember;
              });
            }),
      ],
    );
  }

  AppBar buildAppbar(double _height) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      leading: IconButton(
          icon: const ImageIcon(AssetImage("assets/icons/arrow-left.png")),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text('netigma', style: CustomTypography.h3),
      toolbarHeight: _height * 0.1,
      bottom: PreferredSize(
        child: Container(
          color: CustomColors.dividerGrey,
          height: 1.0,
        ),
        preferredSize: Size.fromHeight(1.0),
      ),
    );
  }
}
