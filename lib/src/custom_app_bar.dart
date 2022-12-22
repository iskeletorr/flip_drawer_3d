import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Color? color;
  final double? elevation;
  final Widget? title;
  final bool? centerTitle;

  /// Animated leading icon, default value is AnimatedIcons.menu_close
  final AnimatedIconData? leading;

  /// Leading icon color, default value is Colors.black
  final Color? leadingColor;
  final AnimationController horizontalController;
  final AnimationController verticalController;

  const CustomAppBar({
    super.key,
    this.color,
    this.elevation,
    this.leading,
    this.title,
    this.centerTitle,
    required this.horizontalController,
    required this.verticalController,
    this.leadingColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      elevation: elevation ?? 0,
      leading: appBarButton(leading),
      centerTitle: centerTitle,
      title: AnimatedOpacity(
        opacity: 1 - horizontalController.value,
        duration: const Duration(seconds: 1),
        child: title,
      ),
    );
  }

  IconButton appBarButton(AnimatedIconData? leadingIcon) {
    return IconButton(
        onPressed: () {
          if (horizontalController.value <= 0.5 && verticalController.value == 0) {
            horizontalController.forward();
          } else if (horizontalController.isCompleted || horizontalController.value >= 0.5) {
            horizontalController.reverse();
          } else if (verticalController.isCompleted || verticalController.value >= 0.5) {
            verticalController.reverse();
          }
        },
        icon: AnimatedIcon(icon: leadingIcon ?? AnimatedIcons.menu_close, progress: verticalController, color: leadingColor ?? Colors.black));
  }
}
