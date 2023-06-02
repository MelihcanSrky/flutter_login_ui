import 'package:custom_widgets/components/typography.dart';
import 'package:custom_widgets/size/sizes_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';

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
                  : buildSearchBoxIcon()
              : widget.prefixIcon != null
                  ? buildPrefixWidgetIconButton(context)
                  : null,
          prefixIconColor: widget.isSearchBox
              ? Theme.of(context).accentColor
              : widget.prefixIconColor,
          //
          //
          // suffix icon settings
          suffixIcon: widget.isPassword != null && widget.isPassword!
              ? buildPasswordSuffixIcon(context)
              : widget.isSearchBox
                  ? !this.isFocused
                      ? widget.controller!.text.isEmpty
                          ? null
                          : buildSearchClearButton()
                      : buildSearchClearButton()
                  : widget.suffixIcon != null
                      ? buildSuffixWidgetIconButton(context)
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
          focusedBorder:
              outlineInputBorder(context, Theme.of(context).primaryColor),
          // enabled border
          enabledBorder:
              outlineInputBorder(context, Theme.of(context).shadowColor),
          // focused error border
          focusedErrorBorder:
              outlineInputBorder(context, Theme.of(context).errorColor),
          // unfocused error border
          errorBorder: outlineInputBorder(
            context,
            Theme.of(context).errorColor,
          ),
        ),
      ),
    );
  }

  IconButton buildSearchBoxIcon() {
    return IconButton(
        onPressed: null,
        icon: SvgPicture.asset(
          "assets/icons/search-outline.svg",
        ));
  }

  IconButton buildPrefixWidgetIconButton(BuildContext context) {
    return IconButton(
        iconSize: context.highValue.h,
        onPressed: null,
        icon: SvgPicture.asset(
          widget.prefixIcon!,
          color: widget.prefixIconColor,
        ));
  }

  IconButton buildSearchClearButton() {
    return IconButton(
        onPressed: () {
          setState(() {
            widget.focusNode!.unfocus();
            widget.controller!.clear();
          });
        },
        icon: SvgPicture.asset(
          "assets/icons/close-circle-twotone.svg",
        ));
  }

  IconButton buildSuffixWidgetIconButton(BuildContext context) {
    return IconButton(
      iconSize: context.highValue.h,
      icon: SvgPicture.asset(
        widget.suffixIcon!,
        color: Theme.of(context).primaryColorLight,
      ),
      onPressed: widget.suffixIconOnPressed != null
          ? widget.suffixIconOnPressed
          : null,
    );
  }

  IconButton buildPasswordSuffixIcon(BuildContext context) {
    return IconButton(
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
    );
  }

  OutlineInputBorder outlineInputBorder(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: !widget.isShadowBorder
          ? BorderSide(
              color: color,
              width: 1.0.w,
            )
          : BorderSide.none,
    );
  }
}
