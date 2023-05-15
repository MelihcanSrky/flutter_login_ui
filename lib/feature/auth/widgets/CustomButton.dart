import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/res/colors.dart';
import 'package:flutter_netigma_login/res/dimens.dart';
import 'package:flutter_netigma_login/res/typography.dart';

import '../../../res/strings.dart';

class CustomButton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.margin_12),
        child: Text(
          widget.text,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.primaryBlue),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0))),
      ),
    );
  }
}
