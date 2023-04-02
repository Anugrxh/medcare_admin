import 'package:flutter/material.dart';
import 'package:medcare_admin/widgets/custom_card.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final IconData? icon;
  final Color? buttonColor, iconColor, labelColor;
  final double elevation;
  final bool isLoading;
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.buttonColor,
    this.iconColor,
    this.labelColor,
    this.elevation = 0,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: buttonColor ?? Colors.white,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: icon != null ? 10 : 20,
            top: 10,
            bottom: 10,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: icon != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: isLoading
                ? [const CircularProgressIndicator()]
                : [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.button?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: labelColor,
                          ),
                    ),
                    SizedBox(
                      width: icon != null ? 5 : 0,
                    ),
                    icon != null
                        ? Icon(
                            icon!,
                            color: iconColor,
                            size: 20,
                          )
                        : const SizedBox()
                  ],
          ),
        ),
      ),
    );
  }
}
