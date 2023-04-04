import 'package:flutter/material.dart';

import '../custom_button.dart';
import '../custom_card.dart';
import '../department_selector.dart';
import '../custom_time_picker.dart';

class AddDeskDialog extends StatelessWidget {
  const AddDeskDialog({
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
                          "Add Desk User",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Enter the following details to add a desk user.",
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
                'Desk User Name',
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
              const Divider(
                height: 30,
                color: Color.fromARGB(66, 176, 176, 176),
              ),
              Text(
                'Email',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              CustomCard(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'eg.deskuser@medcare.com',
                  ),
                ),
              ),
              const Divider(
                height: 30,
                color: Color.fromARGB(66, 176, 176, 176),
              ),
              Text(
                'Phone Number',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              CustomCard(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'eg. 9876543210',
                  ),
                ),
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
