import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../res/dimens.dart';

class CustomTextButton extends StatelessWidget {
  /// Asset image icon
  final String icon;

  /// Text
  final String text;
  const CustomTextButton({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: TextButton.styleFrom(
            elevation: 0,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: 0, vertical: Dimens.margin_14.h)),
        onPressed: () {},
        icon: SvgPicture.asset(icon, color: Theme.of(context).primaryColor),
        label: Text(text,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).primaryColor)));
  }
}
