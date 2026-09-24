import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonColor,
    this.prefixIcon,
    this.suffixIcon,
  });
  final String buttonText;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? buttonColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      width: buttonWidth != null ? size.width * buttonWidth! : double.infinity,
      height: buttonHeight != null ? size.height * buttonHeight! : 50,
      decoration: BoxDecoration(
        color: buttonColor ?? theme.primaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) Icon(prefixIcon),
          Text(
            buttonText,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          if (suffixIcon != null)
            Icon(suffixIcon, color: Colors.white, size: 33),
        ],
      ),
    );
  }
}
