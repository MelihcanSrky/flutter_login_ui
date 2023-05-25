import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.margin_4.w),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(100), boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColorDark.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 0))
        ]),
        child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              fixedSize: MaterialStateProperty.all(
                  Size.fromHeight(Dimens.margin_36.h)),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                  horizontal: Dimens.margin_8.w, vertical: Dimens.margin_8.h)),
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
                  width: Dimens.margin_4.w,
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
