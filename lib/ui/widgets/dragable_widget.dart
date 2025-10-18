import 'package:todo/core/theme.dart';
import 'package:flutter/material.dart';

class DragableWidget extends StatefulWidget {
  const DragableWidget({
    required this.items,
    required this.onChanged,
    super.key,
  });
  final List<String> items;
  final void Function(int selectedIndex) onChanged;

  @override
  State<DragableWidget> createState() => _DragableWidgetState();
}

class _DragableWidgetState extends State<DragableWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: selectedIndex > 0
              ? () {
                  setState(() {
                    selectedIndex > 0 ? selectedIndex-- : selectedIndex;
                  });
                  widget.onChanged(selectedIndex);
                }
              : null,
          icon: Icon(Icons.arrow_left_sharp),
        ),
        SizedBox(
          width: 100,
          child: Text(
            widget.items[selectedIndex],
            style: AppTheme.textTheme.titleLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          onPressed: selectedIndex < widget.items.length - 1
              ? () {
                  setState(() {
                    selectedIndex < widget.items.length - 1
                        ? selectedIndex++
                        : selectedIndex;
                  });
                  widget.onChanged(selectedIndex);
                }
              : null,
          icon: Icon(Icons.arrow_right_sharp),
        ),
      ],
    );
  }
}
