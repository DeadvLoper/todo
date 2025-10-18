import 'package:todo/core/theme.dart';
import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  const AnimatedProgressBar({required this.progress}) : super(key: null);
  final double progress;
  @override
  State<AnimatedProgressBar> createState() => ProgressBarState();
}

class ProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  double get progress => widget.progress;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.shadowColor,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 4,
      width: 120,
      child: Row(
        children: [
          AnimatedBuilder(
            animation: animationController!.view,
            builder: (ctx, _) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.fastOutSlowIn,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppTheme.primaryColor,
                ),
                height: 4,
                width: progress * 120 * animationController!.value,
              );
            },
          ),
        ],
      ),
    );
  }
}
