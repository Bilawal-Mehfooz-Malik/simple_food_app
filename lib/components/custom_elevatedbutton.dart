import 'package:flutter/material.dart';
import 'package:simple_food_app/utils/extensions.dart';
import 'package:simple_food_app/components/border.dart';
import 'package:simple_food_app/components/app_sizes.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Sizes.p12),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: style.colorScheme.primary,
        ),
        child: Center(
          child: Text(
            text,
            style: context.txtTheme.titleMedium!
                .copyWith(color: context.color.onPrimary),
          ),
        ),
      ),
    );
  }
}
