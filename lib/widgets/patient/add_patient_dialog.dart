import 'package:flutter/material.dart';
import 'package:medcare_admin/widgets/custom_date_picker.dart';

import '../custom_button.dart';
import '../custom_card.dart';
import '../custom_radio_button.dart';
import '../department_selector.dart';
import '../custom_time_picker.dart';

class AddPatientDialog extends StatelessWidget {
  const AddPatientDialog({
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
                          "Add Patient",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Enter the following details to add a patient.",
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
                'Name',
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
              const SizedBox(height: 20),
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
                    hintText: 'eg. name@gmail.com',
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              Text(
                'Date of Birth',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              CustomDatePicker(
                onPick: (date) {},
              ),
              const SizedBox(height: 20),
              Text(
                'Gender',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              GenderSelector(
                onSelect: (gender) {},
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

class GenderSelector extends StatefulWidget {
  final Function(String) onSelect;
  const GenderSelector({
    super.key,
    required this.onSelect,
  });

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String _selected = 'male';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomRadioButton(
            onPressed: () {
              widget.onSelect('male');
              _selected = 'male';
              setState(() {});
            },
            label: 'Male',
            isSelected: _selected == 'male',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomRadioButton(
            onPressed: () {
              widget.onSelect('female');
              _selected = 'female';
              setState(() {});
            },
            label: 'Female',
            isSelected: _selected == 'female',
          ),
        ),
      ],
    );
  }
}
