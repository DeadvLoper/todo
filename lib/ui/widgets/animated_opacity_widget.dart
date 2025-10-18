import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key, required this.child});
  final Widget child;

  @override
  State<AnimatedOpacityWidget> createState() => AnimatedOpacityWidgetState();
}

class AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animationController?.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Widget get child => widget.child;

  @override
  Widget build(BuildContext context) {
    if (animationController == null) return child;

    return AnimatedBuilder(
      animation: animationController!.view,
      child: child,
      builder: (ctx, child) {
        return  AnimatedOpacity(
            opacity: animationController!.value,
            duration: const Duration(milliseconds: 300),
            child: child,
        );
      },
    );
  }
}
