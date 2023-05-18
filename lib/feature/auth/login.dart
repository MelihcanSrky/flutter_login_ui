import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_netigma_login/extensions/login_validators.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/custom_button.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/custom_text_field.dart';
import 'package:flutter_netigma_login/feature/auth/widgets/login_desc.dart';
import 'package:flutter_netigma_login/res/colors.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_netigma_login/res/strings.dart';
import 'package:flutter_netigma_login/res/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
                        height: Dimens.margin_16.h,
                      ),
                      LoginDesc(descText: Strings.loginDesc),
                      SizedBox(
                        height: Dimens.margin_24.h,
                      ),
                      CustomTextField(
                        labelText: Strings.userName,
                        validator: validateUserName,
                      ),
                      SizedBox(
                        height: Dimens.margin_12.h,
                      ),
                      CustomTextField(
                        labelText: Strings.password,
                        validator: validatePassword,
                        isPassword: true,
                      ),
                      buildRememberMe(),
                      SizedBox(
                        height: Dimens.margin_24.h,
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
    double _width = MediaQuery.of(context).size.width;
    return Positioned(
      child: Image.asset(
        "assets/images/illustration.png",
        fit: BoxFit.fitWidth,
        width: _width,
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
            inactiveTrackColor: Theme.of(context).primaryColorLight,
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
      centerTitle: true,
      leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/arrow-left.svg",
          ),
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
