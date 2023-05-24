import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/dimens.dart';

class CustomIconButton extends StatelessWidget {
  /// String label
  final String label;

  /// icon path
  final String icon;
  const CustomIconButton({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.margin_4.w),
      child: ElevatedButton.icon(
          style: ButtonStyle(
            fixedSize:
                MaterialStateProperty.all(Size.fromHeight(Dimens.margin_36.h)),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                horizontal: Dimens.margin_8.w, vertical: Dimens.margin_8.h)),
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).backgroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(icon),
          label: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black),
          )),
    );
  }
}
