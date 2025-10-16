
import 'package:cookbook/core/theme.dart';
import 'package:flutter/material.dart';

class AnimatedFlipWidget extends StatefulWidget {
  const AnimatedFlipWidget({required this.child, super.key});
  final Widget child;

  @override
  State<AnimatedFlipWidget> createState() => _AnimatedFlipWidgetState();
}

class _AnimatedFlipWidgetState extends State<AnimatedFlipWidget> {
  bool isSelected = false;

  void setFlip() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setFlip();
      },
      onTap: () {
        if (!isSelected) {
          setState(() {
            isSelected = true;
          });
          return;
        }
        setState(() {
          isSelected = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: AppTheme.secondaryColor, width: 3)
              : null,
          borderRadius: BorderRadius.circular(15),
        ),
        child: widget.child,
      ),
    );
  }
}
