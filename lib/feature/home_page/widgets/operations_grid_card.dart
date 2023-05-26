import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/extensions/sizes_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OperationGridCard extends StatelessWidget {
  /// icon path svg
  final String iconPath;

  /// label text
  final String label;

  /// on tap function
  final Function()? onTap;

  /// Shadow / Border default false = border
  final bool isShadowBox;
  const OperationGridCard({
    super.key,
    required this.iconPath,
    required this.label,
    this.onTap,
    this.isShadowBox = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          top: context.normalValue.h,
        ),
        decoration: isShadowBox
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(context.highValue.r / 4),
                color: Theme.of(context).backgroundColor,
                boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                    ),
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      blurRadius: context.lowValue.r / 2,
                      offset: Offset(0, context.lowValue.h / 2),
                    ),
                  ])
            : BoxDecoration(
                border: Border.all(color: Theme.of(context).shadowColor),
                borderRadius: BorderRadius.circular(context.highValue.r / 4),
                color: Theme.of(context).backgroundColor,
              ),
        child: Column(children: [
          Container(
            padding: context.paddingLow,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.highValue.r / 4),
                color: Theme.of(context).cardColor),
            child: SvgPicture.asset(
              iconPath,
              height: context.highValue.h / 2 + context.lowValue.h,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: context.lowValue.h,
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
