// import 'package:flutter/material.dart';
// import 'package:flutter_netigma_login/extensions/sizes_extensions.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../res/colors.dart';

// class CustomIconButton extends StatelessWidget {
//   /// String label
//   final String label;

//   /// icon path
//   final String icon;

//   /// onPressed
//   final Function()? onPressed;

//   /// Background color of button
//   final Color backgroundPrimaryColor;

//   /// Text color of button
//   final Color textPrimaryColor;

//   /// Icon color of button
//   final Color iconPrimaryColor;

//   /// Create Custom Icon Button
//   ///
//   /// [label] is required
//   /// [icon] is required
//   /// [onPressed] is optional
//   ///
//   /// [backgroundPrimaryColor] is optional
//   /// [textPrimaryColor] is optional
//   /// [iconPrimaryColor] is optional
//   ///
//   const CustomIconButton({
//     super.key,
//     required this.label,
//     required this.icon,
//     this.onPressed,
//     this.backgroundPrimaryColor = Colors.white,
//     this.textPrimaryColor = Colors.black,
//     this.iconPrimaryColor = CustomColors.primaryBlue,
//   });

//   /// CustomIconButton with radio elements
//   ///
//   /// Secondary colors are used when the button is selected
//   ///
//   /// [label] is required
//   /// [icon] is required
//   /// [onPressed] is optional
//   ///
//   /// [value] is optional
//   /// [groupValue] is optional
//   /// [backgroundPrimaryColor] is optional
//   ///
//   /// [backgroundSecondaryColor] is optional
//   /// [textPrimaryColor] is optional
//   /// [textSecondaryColor] is optional
//   ///
//   /// [iconPrimaryColor] is optional
//   /// [iconSecondaryColor] is optional
//   ///
//   factory CustomIconButton.radio({
//     required String label,
//     required String icon,
//     Function()? onPressed,
//     int? value,
//     int? groupValue,
//     Color backgroundPrimaryColor,
//     Color backgroundSecondaryColor,
//     Color textPrimaryColor,
//     Color textSecondaryColor,
//     Color iconPrimaryColor,
//     Color iconSecondaryColor,
//   }) = _CustomIconButtonWithRadio;

//   @override
//   Widget build(BuildContext context) {
//     return _CustomButtonWithIcon(
//       onPressed: onPressed,
//       icon: icon,
//       label: label,
//       groupValue: null,
//       value: null,
//       backgroundPrimaryColor: backgroundPrimaryColor,
//       textPrimaryColor: textPrimaryColor,
//       iconPrimaryColor: iconPrimaryColor,
//     );
//   }
// }

// class _CustomIconButtonWithRadio extends CustomIconButton {
//   /// button index
//   final int? value;

//   /// selected index
//   final int? groupValue;

//   /// Background color of button when selected
//   final Color backgroundSecondaryColor;

//   /// Text color of button when selected
//   final Color textSecondaryColor;

//   /// Icon color of button when selected
//   final Color iconSecondaryColor;

//   const _CustomIconButtonWithRadio({
//     super.key,
//     required super.label,
//     required super.icon,
//     super.onPressed,
//     this.value,
//     this.groupValue,
//     super.backgroundPrimaryColor,
//     this.backgroundSecondaryColor = CustomColors.primaryBlue,
//     super.textPrimaryColor,
//     this.textSecondaryColor = Colors.white,
//     super.iconPrimaryColor,
//     this.iconSecondaryColor = Colors.white,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return _CustomButtonWithIcon(
//       value: value,
//       groupValue: groupValue,
//       onPressed: onPressed,
//       icon: icon,
//       label: label,
//       backgroundPrimaryColor: backgroundPrimaryColor,
//       backgroundSecondaryColor: backgroundSecondaryColor,
//       textPrimaryColor: textPrimaryColor,
//       textSecondaryColor: textSecondaryColor,
//       iconPrimaryColor: iconPrimaryColor,
//       iconSecondaryColor: iconSecondaryColor,
//     );
//   }
// }

// class _CustomButtonWithIcon extends StatefulWidget {
//   const _CustomButtonWithIcon({
//     super.key,
//     required this.value,
//     required this.groupValue,
//     required this.onPressed,
//     required this.icon,
//     required this.label,
//     this.backgroundPrimaryColor = Colors.white,
//     this.backgroundSecondaryColor = CustomColors.primaryBlue,
//     this.textPrimaryColor = Colors.black,
//     this.textSecondaryColor = Colors.white,
//     this.iconPrimaryColor = CustomColors.primaryBlue,
//     this.iconSecondaryColor = Colors.white,
//   });

//   final int? value;
//   final int? groupValue;
//   final Function()? onPressed;
//   final String icon;
//   final String label;
//   final Color backgroundPrimaryColor;
//   final Color backgroundSecondaryColor;
//   final Color textPrimaryColor;
//   final Color textSecondaryColor;
//   final Color iconPrimaryColor;
//   final Color iconSecondaryColor;

//   @override
//   State<_CustomButtonWithIcon> createState() => _CustomButtonWithIconState();
// }

// class _CustomButtonWithIconState extends State<_CustomButtonWithIcon> {
//   late int? value;
//   late int? groupValue;
//   late Function()? onPressed;
//   late String icon;
//   late String label;
//   late Color backgroundPrimaryColor;
//   late Color backgroundSecondaryColor;
//   late Color textPrimaryColor;
//   late Color textSecondaryColor;
//   late Color iconPrimaryColor;
//   late Color iconSecondaryColor;

//   @override
//   void initState() {
//     super.initState();
//     value = widget.value;
//     groupValue = widget.groupValue;
//     onPressed = widget.onPressed;
//     icon = widget.icon;
//     label = widget.label;
//     backgroundPrimaryColor = widget.backgroundPrimaryColor;
//     backgroundSecondaryColor = widget.backgroundSecondaryColor;
//     textPrimaryColor = widget.textPrimaryColor;
//     textSecondaryColor = widget.textSecondaryColor;
//     iconPrimaryColor = widget.iconPrimaryColor;
//     iconSecondaryColor = widget.iconSecondaryColor;
//   }

//   MaterialStateProperty<Color> _backgroundColor() {
//     if (value != null && groupValue != null)
//       return MaterialStateProperty.all(widget.value != widget.groupValue
//           ? widget.backgroundPrimaryColor
//           : widget.backgroundSecondaryColor);
//     else
//       return MaterialStateProperty.all(widget.backgroundPrimaryColor);
//   }

//   Color _textColor() {
//     if (value != null && groupValue != null)
//       return widget.value != widget.groupValue
//           ? widget.textPrimaryColor
//           : widget.textSecondaryColor;
//     else
//       return widget.textPrimaryColor;
//   }

//   Color _iconColor() {
//     if (value != null && groupValue != null)
//       return widget.value != widget.groupValue
//           ? widget.iconPrimaryColor
//           : widget.iconSecondaryColor;
//     else
//       return widget.iconPrimaryColor;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: context.lowValue.w / 2),
//       child: Container(
//         decoration:
//             BoxDecoration(borderRadius: BorderRadius.circular(100), boxShadow: [
//           BoxShadow(
//               color: Theme.of(context).primaryColorDark.withOpacity(0.2),
//               blurRadius: 1,
//               offset: Offset(0, 0))
//         ]),
//         child: ElevatedButton(
//             style: ButtonStyle(
//               elevation: MaterialStateProperty.all(0),
//               fixedSize: MaterialStateProperty.all(
//                   Size.fromHeight(context.highValue.h * 1.5)),
//               padding: MaterialStateProperty.all(context.paddingLow),
//               backgroundColor: _backgroundColor(),
//               shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(100))),
//             ),
//             onPressed: widget.onPressed,
//             child: Row(
//               children: [
//                 SvgPicture.asset(
//                   widget.icon,
//                   color: _iconColor(),
//                 ),
//                 SizedBox(
//                   width: context.lowValue.w / 2,
//                 ),
//                 Text(widget.label,
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           color: _textColor(),
//                         ))
//               ],
//             )),
//       ),
//     );
//   }
// }
