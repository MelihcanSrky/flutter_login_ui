import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/CustomButton.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/CustomTextField.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/LoginDesc.dart';
import 'package:flutter_netigma_login/res/colors.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_netigma_login/res/strings.dart';
import 'package:flutter_netigma_login/res/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            padding: EdgeInsets.symmetric(horizontal: Dimens.marginDefault.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: Dimens.margin_60.h,
                      ),
                      Text(
                        Strings.login,
                        style: CustomTypography.h3.copyWith(
                            color: Theme.of(context).primaryColorDark),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: _height * 0.02.h,
                      ),
                      LoginDesc(descText: Strings.loginDesc),
                      SizedBox(
                        height: Dimens.margin_24.h,
                      ),
                      CustomTextField(
                        labelText: Strings.userName,
                      ),
                      SizedBox(
                        height: Dimens.margin_12.h,
                      ),
                      CustomTextField(
                        labelText: Strings.password,
                        isPassword: true,
                      ),
                      buildRememberMe(),
                      SizedBox(
                        height: _height * 0.02.h,
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
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.margin_14.w, vertical: Dimens.margin_14.h),
      child: Text(Strings.poweredBy,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).primaryColorDark,
              )),
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
          padding: EdgeInsets.symmetric(horizontal: Dimens.margin_8.w),
          child: Text(
            Strings.rememberMe,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        Switch.adaptive(
            activeColor: Theme.of(context).primaryColor,
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
      title: Text('netigma',
          style: CustomTypography.h3
              .copyWith(color: Theme.of(context).primaryColorDark)),
      toolbarHeight: _height * 0.1.h,
    );
  }
}
