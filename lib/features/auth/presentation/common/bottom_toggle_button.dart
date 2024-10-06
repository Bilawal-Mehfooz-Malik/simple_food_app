import 'package:flutter/material.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/utils/extensions.dart';

class BottomToggleButton extends StatelessWidget {
  const BottomToggleButton({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  });

  final String firstText;
  final String secondText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var style = context.txtTheme.titleSmall!.copyWith(
      color: context.color.primary,
      fontWeight: FontWeight.bold,
    );

    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(firstText, style: TextStyle(color: context.color.onSurface)),
          gapW4,
          Text(secondText, style: style),
        ],
      ),
    );
  }
}