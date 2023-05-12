import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/dimens.dart';
import '../../../res/typography.dart';

class CustomTextButton extends StatelessWidget {
  /// Asset image icon
  final AssetImage icon;

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
                horizontal: 0, vertical: Dimens.margin_14)),
        onPressed: () {},
        icon: ImageIcon(
          icon,
          color: CustomColors.primaryBlue,
        ),
        label: Text(
          text,
          style: CustomTypography.h5_semibold.copyWith(
            color: CustomColors.primaryBlue,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
