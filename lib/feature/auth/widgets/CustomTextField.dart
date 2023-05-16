import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/res/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../res/colors.dart';
import '../../../res/dimens.dart';

class CustomTextField extends StatefulWidget {
  /// Label Text
  final String labelText;

  /// Sol tarafta bulunan icon
  final String? prefixIcon;

  /// Sağ tarafta bulunan icon
  final String? suffixIcon;

  /// Sağ tarafta bulunan icona tıklandığında çalışacak fonksiyon
  final Function()? suffixIconOnPressed;

  /// Text Editing Controller
  final TextEditingController? controller;

  /// Border Radius
  final double borderRadius;

  /// Floating Label Behavior true = auto / false = never
  final bool floatingLabelBehavior;

  /// Prefix icon color
  final Color prefixIconColor;

  /// Şifre alanı mı değil mi
  /// Şifre alanıysa suffixIcon otomatik gösterilir
  /// suffix icon eklenmez
  /// Göz iconuna tıklandığında şifre görünür hale gelir
  final bool? isPassword;
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.isPassword,
      this.controller,
      this.suffixIconOnPressed,
      this.borderRadius = Dimens.borderRadiusDefault,
      this.floatingLabelBehavior = true,
      this.prefixIconColor = CustomColors.primaryBlue});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isPasswordLock;
  @override
  void initState() {
    super.initState();
    isPasswordLock = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword != null && widget.isPassword!
          ? isPasswordLock
          : false,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).primaryColorDark,
          ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: Dimens.margin_16.w,
          vertical: Dimens.margin_16.h,
        ),
        prefixIcon: widget.prefixIcon != null
            ? IconButton(
                iconSize: Dimens.margin_24.h,
                onPressed: null,
                icon: SvgPicture.asset(
                  widget.prefixIcon!,
                  color: widget.prefixIconColor,
                ))
            : null,
        prefixIconColor: widget.prefixIconColor,
        suffixIcon: widget.isPassword != null && widget.isPassword!
            ? IconButton(
                iconSize: Dimens.margin_24.h,
                icon: isPasswordLock
                    ? SvgPicture.asset(
                        "assets/icons/eye-slash.svg",
                      )
                    : SvgPicture.asset(
                        "assets/icons/eye.svg",
                      ),
                onPressed: () {
                  setState(() {
                    isPasswordLock = !isPasswordLock;
                  });
                },
              )
            : widget.suffixIcon != null
                ? IconButton(
                    iconSize: Dimens.margin_24.h,
                    icon: SvgPicture.asset(
                      widget.suffixIcon!,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    onPressed: widget.suffixIconOnPressed != null
                        ? widget.suffixIconOnPressed
                        : null,
                  )
                : null,
        suffixIconColor: widget.isPassword != null && widget.isPassword!
            ? isPasswordLock
                ? Theme.of(context).primaryColorLight
                : Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColorLight,
        labelText: (widget.labelText),
        floatingLabelBehavior: widget.floatingLabelBehavior
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        floatingLabelStyle: CustomTypography.special_semibold.copyWith(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: Theme.of(context).textTheme.titleMedium,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).shadowColor,
            width: 1.0.w,
          ),
        ),
      ),
    );
  }
}
