import 'package:flutter/material.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/components/breakpoints.dart';
import 'package:simple_food_app/utils/extensions.dart';

/// Reusable widget for showing a child with a maximum content width constraint.
/// If available width is larger than the maximum width, the child will be
/// centered.
/// If available width is smaller than the maximum width, the child use all the
/// available width.
class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter({
    super.key,
    this.maxContentWidth = Breakpoint.desktop,
    this.padding = EdgeInsets.zero,
    this.showBorder = false,
    required this.child,
  });
  final double maxContentWidth;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          margin: showBorder && constraints.maxWidth >= maxContentWidth
              ? const EdgeInsets.all(Sizes.p4)
              : null,
          decoration: showBorder && constraints.maxWidth >= maxContentWidth
              ? BoxDecoration(
                  border: Border.all(color: context.color.secondary),
                  borderRadius: BorderRadius.circular(Sizes.p8),
                )
              : null,
          width: maxContentWidth,
          child: Padding(padding: padding, child: child),
        );
      }),
    );
  }
}

/// Sliver-equivalent of [ResponsiveCenter].
class ResponsiveSliverCenter extends StatelessWidget {
  const ResponsiveSliverCenter({
    super.key,
    this.maxContentWidth = Breakpoint.desktop,
    this.padding = EdgeInsets.zero,
    this.showBorder = false,
    required this.child,
  });
  final double maxContentWidth;
  final EdgeInsetsGeometry padding;
  final bool showBorder;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ResponsiveCenter(
        maxContentWidth: maxContentWidth,
        padding: padding,
        showBorder: showBorder,
        child: child,
      ),
    );
  }
}
