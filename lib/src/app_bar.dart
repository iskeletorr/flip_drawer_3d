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
  final AnimationController animationController;
  final AnimationController animationController2;

  const CustomAppBar({
    super.key,
    this.color,
    this.elevation,
    this.leading,
    this.title,
    this.centerTitle,
    required this.animationController,
    required this.animationController2,
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
        opacity: 1 - animationController.value,
        duration: const Duration(seconds: 1),
        child: title,
      ),
    );
  }

  IconButton appBarButton(AnimatedIconData? leadingIcon) {
    return IconButton(
        onPressed: () {
          if (animationController.value <= 0.5 && animationController2.value == 0) {
            animationController.forward();
          } else if (animationController.isCompleted || animationController.value >= 0.5) {
            animationController.reverse();
          } else if (animationController2.isCompleted || animationController2.value >= 0.5) {
            animationController2.reverse();
          }
        },
        icon: AnimatedIcon(icon: leadingIcon ?? AnimatedIcons.menu_close, progress: animationController2, color: leadingColor ?? Colors.black));
  }
}
