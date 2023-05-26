import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/extensions/login_validators.dart';
import 'package:flutter_netigma_login/extensions/sizes_extensions.dart';
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

  /// Shadow border ya da normal border
  /// Default olarak normal border
  final bool isShadowBorder;

  /// Arama alanı mı değil mi
  /// default olarak false
  /// true ise prefix icon ve suffix icon otomatik olarak eklenir
  final bool isSearchBox;

  /// focus node
  /// focus node verilirse focus node ile birlikte çalışır
  final FocusNode? focusNode;

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

  /// Vertical padding opsiyonel
  /// Harita sayfası arama kutusu için kullanıldı
  final double verticalPadding;

  /// Özellikler
  ///
  /// TextFormField widget'inden inherit edilmiştir.
  ///
  /// 1- isPassword: true durumunda değişiklik gerektirmez. Otomatik olarak şifre gizle göster yapar.
  /// Buton işlevseldir. validator parametresi atanarak kullanıcı adı ve şifre için kontroller eklenebilir.
  ///
  /// 2 - isSearchBox: true durumunda değişiklik gerektirmez. Otomatik olarak arama alanı görünümü sağlar.
  /// Prefix ve suffix icon gerektirmez ve otomatik olarak eklenir.
  /// suffix icon aktiftir. controller eklenerek arama alanı için kullanılabilir.
  ///
  /// 3- isShadowBorder: true durumunda değişiklik gerektirmez. Otomatik olarak gölge efekti ekler.
  /// false durumunda normal border ekler.
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.isPassword,
      this.controller,
      this.suffixIconOnPressed,
      this.borderRadius = 12,
      this.floatingLabelBehavior = true,
      this.prefixIconColor = CustomColors.primaryBlue,
      this.validator,
      this.isShadowBorder = false,
      this.isSearchBox = false,
      this.focusNode,
      this.verticalPadding = 16});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isPasswordLock;
  String? _errorText = null;
  bool isFocused = false;
  @override
  void initState() {
    super.initState();
    isPasswordLock = true;
    widget.focusNode?.addListener(() {
      setState(() {
        isFocused = widget.focusNode!.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: widget.isShadowBorder
            ? [
                BoxShadow(
                  color: Theme.of(context).primaryColorDark.withOpacity(0.2),
                  blurRadius: 1,
                  offset: Offset(0, 0),
                )
              ]
            : null,
      ),
      child: TextFormField(
        focusNode: widget.focusNode,
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
            horizontal: context.normalValue,
            vertical: widget.verticalPadding,
          ),
          //
          //
          // prefix icon settings
          prefixIcon: widget.isSearchBox
              ? this.isFocused || widget.controller!.text.isNotEmpty
                  ? null
                  : IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(
                        "assets/icons/search-outline.svg",
                      ))
              : widget.prefixIcon != null
                  ? IconButton(
                      iconSize: context.highValue.h,
                      onPressed: null,
                      icon: SvgPicture.asset(
                        widget.prefixIcon!,
                        color: widget.prefixIconColor,
                      ))
                  : null,
          prefixIconColor: widget.isSearchBox
              ? Theme.of(context).accentColor
              : widget.prefixIconColor,
          //
          //
          // suffix icon settings
          suffixIcon: widget.isPassword != null && widget.isPassword!
              ? IconButton(
                  iconSize: context.highValue.h,
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
              : widget.isSearchBox
                  ? !this.isFocused
                      ? widget.controller!.text.isEmpty
                          ? null
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.focusNode!.unfocus();
                                  widget.controller!.clear();
                                });
                              },
                              icon: SvgPicture.asset(
                                "assets/icons/close-circle-twotone.svg",
                              ))
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              widget.focusNode!.unfocus();
                              widget.controller!.clear();
                            });
                          },
                          icon: SvgPicture.asset(
                            "assets/icons/close-circle-twotone.svg",
                          ))
                  : widget.suffixIcon != null
                      ? IconButton(
                          iconSize: context.highValue.h,
                          onPressed: widget.suffixIconOnPressed != null
                              ? widget.suffixIconOnPressed
                              : null,
                          icon: SvgPicture.asset(
                            widget.suffixIcon!,
                            color: Theme.of(context).primaryColorLight,
                          ))
                      : widget.suffixIcon != null
                          ? IconButton(
                              iconSize: context.highValue.h,
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
              )),
          // enabled border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: !widget.isShadowBorder
                ? BorderSide(
                    color: Theme.of(context).shadowColor,
                    width: 1.0.w,
                  )
                : BorderSide.none,
          ),
          // focused error border
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: !widget.isShadowBorder
                ? BorderSide(
                    color: Theme.of(context).errorColor,
                    width: 1.0.w,
                  )
                : BorderSide.none,
          ),
          // unfocused error border
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: !widget.isShadowBorder
                ? BorderSide(
                    color: Theme.of(context).errorColor,
                    width: 1.0.w,
                  )
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
