import 'package:flutter/material.dart';

import 'custom_card.dart';

class CustomTimePicker extends StatefulWidget {
  final Function(TimeOfDay) onPick;
  const CustomTimePicker({
    super.key,
    required this.onPick,
  });

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay? pickedTime;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: () async {
        pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (pickedTime != null) {
          setState(() {});
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Align(
          alignment:
              pickedTime != null ? Alignment.center : Alignment.centerLeft,
          child: Text(
            pickedTime != null ? pickedTime!.format(context) : 'Select Time',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: pickedTime != null ? Colors.black54 : Colors.black45,
                  fontWeight:
                      pickedTime != null ? FontWeight.bold : FontWeight.normal,
                ),
          ),
        ),
      ),
    );
  }
}
