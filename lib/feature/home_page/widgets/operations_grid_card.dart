import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OperationGridCard extends StatelessWidget {
  /// icon path svg
  final String iconPath;

  /// label text
  final String label;

  /// on tap function
  final Function()? onTap;
  const OperationGridCard({
    super.key,
    required this.iconPath,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          top: Dimens.margin_16.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).shadowColor),
          borderRadius: BorderRadius.circular(Dimens.margin_6.r),
          color: Theme.of(context).backgroundColor,
        ),
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimens.margin_8.w, vertical: Dimens.margin_8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.margin_8.r),
                color: Theme.of(context).cardColor),
            child: SvgPicture.asset(
              iconPath,
              height: Dimens.margin_20.h,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: Dimens.margin_8.h,
          ),
          Text(label,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).primaryColorDark)),
        ]),
      ),
    );
  }
}