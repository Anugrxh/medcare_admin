import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title, message;
  final String? primaryButtonLabel, secondaryButtonLabel;
  final Function()? primaryOnPressed, secondaryOnPressed;
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    this.primaryButtonLabel,
    this.secondaryButtonLabel,
    this.primaryOnPressed,
    this.secondaryOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  secondaryButtonLabel != null
                      ? Expanded(
                          child: CustomButton(
                            label: secondaryButtonLabel ?? '',
                            onPressed: secondaryOnPressed ??
                                () {
                                  Navigator.pop(context);
                                },
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                      width: secondaryButtonLabel != null &&
                              primaryButtonLabel != null
                          ? 10
                          : 0),
                  primaryButtonLabel != null
                      ? Expanded(
                          child: CustomButton(
                            label: primaryButtonLabel ?? '',
                            labelColor: Colors.white,
                            buttonColor: Colors.blue,
                            onPressed: primaryOnPressed ??
                                () {
                                  Navigator.pop(context);
                                },
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
