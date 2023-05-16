import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/theme/light/light_theme.dart';
import 'package:flutter_netigma_login/theme/theme_notifer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
      padding: EdgeInsets.symmetric(horizontal: Dimens.margin_16.w),
      child: Text(
        descText,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
