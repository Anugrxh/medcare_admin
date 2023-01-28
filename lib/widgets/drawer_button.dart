import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onPressed;
  const DrawerButton({
    Key? key,
    required this.label,
    this.isSelected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: isSelected ? 10 : 0,
      borderRadius: BorderRadius.circular(30),
      color: isSelected ? Colors.white : Colors.grey[300],
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
