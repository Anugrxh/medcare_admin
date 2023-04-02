import 'package:flutter/material.dart';
import 'package:medcare_admin/widgets/custom_card.dart';

class DepartmentSelector extends StatelessWidget {
  const DepartmentSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: DropdownMenu(
        hintText: 'All Departments',
        initialSelection: 'all',
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        dropdownMenuEntries: const [
          DropdownMenuEntry(
            value: 'all',
            label: 'All Departments',
          ),
          DropdownMenuEntry(
            value: 'ortho',
            label: 'Ortho',
          ),
          DropdownMenuEntry(
            value: 'some',
            label: 'Somethong',
          ),
          DropdownMenuEntry(
            value: 'any',
            label: 'Anything',
          ),
        ],
      ),
    );
  }
}
