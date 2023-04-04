import 'package:flutter/material.dart';

import '../custom_button.dart';
import '../custom_card.dart';
import '../department_selector.dart';
import '../custom_time_picker.dart';

class AddDoctorDialog extends StatelessWidget {
  const AddDoctorDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          width: 1,
          color: Colors.black26,
        ),
      ),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Doctor",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Enter the following details to add a doctor.",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      ],
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
              const Divider(
                height: 30,
                color: Color.fromARGB(66, 176, 176, 176),
              ),
              Text(
                'Dr Name',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              CustomCard(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'eg. Mr.John',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Department',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              const DepartmentSelector(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time From',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        CustomTimePicker(
                          onPick: (time) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time To',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        CustomTimePicker(
                          onPick: (time) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Max. Token',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        CustomCard(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'eg. 100',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fee',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        CustomCard(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'eg. 10000',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 30,
                color: Color.fromARGB(66, 176, 176, 176),
              ),
              CustomButton(
                label: 'Add',
                labelColor: Colors.white,
                buttonColor: Colors.blue,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
