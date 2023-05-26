import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../res/dimens.dart';

class CustomTextButton extends StatefulWidget {
  /// Asset image icon
  final String icon;

  /// Text
  final String text;

  /// onPressed
  final Function()? onPressed;
  const CustomTextButton({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: TextButton.styleFrom(
            elevation: 0,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 14.h)),
        onPressed: widget.onPressed,
        icon: SvgPicture.asset(widget.icon,
            color: Theme.of(context).primaryColor),
        label: Text(widget.text,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).primaryColor)));
  }
}
