import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/extensions/sizes_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/colors.dart';
import '../../../res/dimens.dart';

class CustomIconButton extends StatelessWidget {
  /// String label
  final String label;

  /// icon path
  final String icon;

  /// onPressed
  final Function()? onPressed;
  const CustomIconButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
  });

  /// CustomIconButton with radio elements
  factory CustomIconButton.radio({
    required String label,
    required String icon,
    Function()? onPressed,
    int? value,
    int? groupValue,
  }) = _CustomIconButtonWithRadio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.lowValue.w / 2),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(100), boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColorDark.withOpacity(0.2),
              blurRadius: 1,
              offset: Offset(0, 0))
        ]),
        child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              fixedSize: MaterialStateProperty.all(
                  Size.fromHeight(context.highValue.h * 1.5)),
              padding: MaterialStateProperty.all(context.paddingLow),
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).backgroundColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100))),
            ),
            onPressed: onPressed,
            child: Row(
              children: [
                SvgPicture.asset(icon),
                SizedBox(
                  width: context.lowValue.w / 2,
                ),
                Text(
                  label,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                )
              ],
            )),
      ),
    );
  }
}

class _CustomIconButtonWithRadio extends CustomIconButton {
  /// button index
  final int? value;

  /// selected index
  final int? groupValue;

  /// Active Color
  final Color activeColor;

  const _CustomIconButtonWithRadio({
    super.key,
    required super.label,
    required super.icon,
    super.onPressed,
    this.value,
    this.groupValue,
    this.activeColor = CustomColors.primaryBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.lowValue.w / 2),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(100), boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColorDark.withOpacity(0.2),
              blurRadius: 1,
              offset: Offset(0, 0))
        ]),
        child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              fixedSize: MaterialStateProperty.all(
                  Size.fromHeight(context.highValue.h * 1.5)),
              padding: MaterialStateProperty.all(context.paddingLow),
              backgroundColor: MaterialStateProperty.all(value == groupValue
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).backgroundColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100))),
            ),
            onPressed: onPressed,
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  color: !(value == groupValue)
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).backgroundColor,
                ),
                SizedBox(
                  width: context.lowValue.w / 2,
                ),
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: (value == groupValue)
                          ? Theme.of(context).backgroundColor
                          : Colors.black),
                )
              ],
            )),
      ),
    );
  }
}
