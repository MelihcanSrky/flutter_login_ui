import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/extensions/sizes_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/dimens.dart';

class LoginDesc extends StatelessWidget {
  final String descText;
  const LoginDesc({
    super.key,
    required this.descText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHighHorizontal,
      child: Text(
        descText,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
