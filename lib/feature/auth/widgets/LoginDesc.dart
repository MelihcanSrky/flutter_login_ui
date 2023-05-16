import 'package:flutter/material.dart';
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
      padding: EdgeInsets.symmetric(horizontal: Dimens.margin_24.w),
      child: Text(
        descText,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
