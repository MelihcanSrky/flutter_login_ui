import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/extensions/login_validators.dart';
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

  /// Validator
  final String? Function(String?)? validator;

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
      this.prefixIconColor = CustomColors.primaryBlue,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isPasswordLock;
  String? _errorText = null;
  @override
  void initState() {
    super.initState();
    isPasswordLock = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.validator != null
          ? (value) {
              setState(() {
                _errorText = widget.validator!(value);
              });
            }
          : null,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword != null && widget.isPassword!
          ? isPasswordLock
          : false,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).primaryColorDark,
          ),
      //
      //
      // decoration settings
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).backgroundColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: Dimens.margin_16.w,
          vertical: Dimens.margin_16.h,
        ),
        //
        //
        // prefix icon settings
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
        //
        //
        // suffix icon settings
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
        //
        //
        // label settings
        labelText: (widget.labelText),
        errorText: _errorText,
        floatingLabelBehavior: widget.floatingLabelBehavior
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        floatingLabelStyle: CustomTypography.special_semibold.copyWith(
          color: _errorText == null
              ? Theme.of(context).primaryColor
              : Theme.of(context).errorColor,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: Theme.of(context).textTheme.titleMedium,
        //
        //
        // border settings
        // focused border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0.w,
          ),
        ),
        // enabled border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).shadowColor,
            width: 1.0.w,
          ),
        ),
        // focused error border
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).errorColor,
            width: 1.0.w,
          ),
        ),
        // unfocused error border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).errorColor,
            width: 1.0.w,
          ),
        ),
      ),
    );
  }
}