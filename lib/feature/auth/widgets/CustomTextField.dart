import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/res/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/colors.dart';
import '../../../res/dimens.dart';

class CustomTextField extends StatefulWidget {
  /// Label Text
  final String labelText;

  /// Sol tarafta bulunan icon
  final AssetImage? prefixIcon;

  /// Sağ tarafta bulunan icon
  final AssetImage? suffixIcon;

  /// Sağ tarafta bulunan icona tıklandığında çalışacak fonksiyon
  final Function()? suffixIconOnPressed;

  /// Text Editing Controller
  final TextEditingController? controller;

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
      this.suffixIconOnPressed});

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
      style: CustomTypography.h4_regular,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(Dimens.margin_16.r),
        prefixIcon:
            widget.prefixIcon != null ? ImageIcon(widget.prefixIcon) : null,
        prefixIconColor: CustomColors.primaryBlue,
        suffixIcon: widget.isPassword != null && widget.isPassword!
            ? IconButton(
                icon: isPasswordLock
                    ? ImageIcon(
                        AssetImage("assets/icons/eye-slash.png"),
                      )
                    : ImageIcon(
                        AssetImage("assets/icons/eye.png"),
                      ),
                onPressed: () {
                  setState(() {
                    isPasswordLock = !isPasswordLock;
                  });
                },
              )
            : widget.suffixIcon != null
                ? IconButton(
                    icon: ImageIcon(widget.suffixIcon),
                    onPressed: widget.suffixIconOnPressed != null
                        ? widget.suffixIconOnPressed
                        : null,
                  )
                : null,
        suffixIconColor: widget.isPassword != null && widget.isPassword!
            ? isPasswordLock
                ? CustomColors.secondaryText
                : CustomColors.primaryText
            : CustomColors.secondaryText,
        labelText: (widget.labelText),
        floatingLabelStyle: CustomTypography.special_semibold.copyWith(
          color: CustomColors.primaryBlue,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: Theme.of(context).textTheme.titleMedium,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.borderRadiusDefault),
          borderSide: BorderSide(
            color: CustomColors.primaryBlue,
            width: 1.0.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.borderRadiusDefault),
          borderSide: BorderSide(
            color: CustomColors.dividerGrey,
            width: 1.0.w,
          ),
        ),
      ),
    );
  }
}
