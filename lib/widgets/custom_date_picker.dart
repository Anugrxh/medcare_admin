import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_card.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime) onPick;
  const CustomDatePicker({
    super.key,
    required this.onPick,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: () async {
        pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(
            const Duration(days: 365 * 100),
          ),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
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
              pickedDate != null ? Alignment.center : Alignment.centerLeft,
          child: Text(
            pickedDate != null
                ? DateFormat('dd/MM/yyyy').format(pickedDate!)
                : 'Select Date',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: pickedDate != null ? Colors.black54 : Colors.black45,
                  fontWeight:
                      pickedDate != null ? FontWeight.bold : FontWeight.normal,
                ),
          ),
        ),
      ),
    );
  }
}
