import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/dimens.dart';
import '../../../res/strings.dart';
import '../../../res/typography.dart';

class LoginDesc extends StatelessWidget {
  final String descText;
  const LoginDesc({
    super.key,
    required this.descText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.margin_16),
      child: Text(
        descText,
        style: CustomTypography.h5_regular
            .copyWith(color: CustomColors.secondaryText),
        textAlign: TextAlign.center,
      ),
    );
  }
}
