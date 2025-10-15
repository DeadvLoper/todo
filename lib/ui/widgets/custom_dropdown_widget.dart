import 'package:cookbook/core/theme.dart';
import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatefulWidget {
  const CustomDropdownWidget({
    super.key,
    required this.items,
    required this.onChanged,
  });
  final List<String> items;
  final void Function(String changedValue) onChanged;

  @override
  State<CustomDropdownWidget> createState() => DropDownState();
}

class DropDownState extends State<CustomDropdownWidget> {
  List<String> get items => widget.items;
  void Function(String newValue) get onChanged => widget.onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      constraints: BoxConstraints(minWidth: 150),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton<String>(
        underline: SizedBox(),
        icon: Icon(Icons.priority_high_sharp),
      
        style: TextStyle(),
        borderRadius: BorderRadius.circular(15),
        value: items.first,
        items: items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item.toUpperCase(),
                  style: TextStyle(),
                ),
              ),
            )
            .toList(),
        onChanged: (String? newValue) {
          onChanged(newValue ?? items.first);
        },
      ),
    );
  }
}
