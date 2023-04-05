import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcare_admin/blocs/doctor/doctor_bloc.dart';

import '../custom_alert_dialog.dart';
import '../custom_button.dart';
import '../custom_card.dart';
import '../custom_date_picker.dart';
import '../department_selector.dart';
import '../custom_time_picker.dart';
import '../gender_selector.dart';

class AddDoctorDialog extends StatefulWidget {
  const AddDoctorDialog({
    super.key,
  });

  @override
  State<AddDoctorDialog> createState() => _AddDoctorDialogState();
}

class _AddDoctorDialogState extends State<AddDoctorDialog> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _maxTokenController = TextEditingController();
  final TextEditingController _feeController = TextEditingController();

  int? _departmentId;
  String _gender = 'male';

  DateTime? _dob;
  TimeOfDay? _timeFrom, _timeTo;

  bool _isObscure = true;

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
        width: 800,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formState,
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
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Enter the following details to add a doctor.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr Name',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          CustomCard(
                            child: TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value != null && value.trim().isNotEmpty) {
                                  return null;
                                } else {
                                  return 'Enter name';
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'eg. Mr.John',
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Email',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          CustomCard(
                            child: TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value != null && value.trim().isNotEmpty) {
                                  return null;
                                } else {
                                  return 'Enter email';
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'eg. john@medcare.com',
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Password',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          CustomCard(
                            child: TextFormField(
                              obscureText: _isObscure,
                              controller: _passwordController,
                              validator: (value) {
                                if (value != null && value.trim().isNotEmpty) {
                                  return null;
                                } else {
                                  return 'Enter password';
                                }
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _isObscure = !_isObscure;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                  ),
                                ),
                                hintText: 'password',
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Phone Number',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          CustomCard(
                            child: TextFormField(
                              controller: _phoneNumberController,
                              validator: (value) {
                                if (value != null && value.trim().isNotEmpty) {
                                  return null;
                                } else {
                                  return 'Enter phone';
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'eg. 987654328',
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Gender',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          GenderSelector(
                            selected: _gender,
                            onSelect: (gender) {
                              _gender = gender;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            'Department',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          DepartmentSelector(
                            onSelect: (departmentId) {
                              _departmentId = departmentId;
                            },
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Date of Birth',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          CustomDatePicker(
                            onPick: (date) {
                              _dob = date;
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Time From',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 5),
                                    CustomTimePicker(
                                      onPick: (time) {
                                        _timeFrom = time;
                                      },
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 5),
                                    CustomTimePicker(
                                      onPick: (time) {
                                        _timeTo = time;
                                      },
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 5),
                                    CustomCard(
                                      child: TextFormField(
                                        controller: _maxTokenController,
                                        validator: (value) {
                                          if (value != null &&
                                              value.trim().isNotEmpty) {
                                            return null;
                                          } else {
                                            return 'Enter maximum token';
                                          }
                                        },
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 5),
                                    CustomCard(
                                      child: TextFormField(
                                        controller: _feeController,
                                        validator: (value) {
                                          if (value != null &&
                                              value.trim().isNotEmpty) {
                                            return null;
                                          } else {
                                            return 'Enter fee';
                                          }
                                        },
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
                  onPressed: () {
                    if (_formState.currentState!.validate() &&
                        _dob != null &&
                        _timeFrom != null &&
                        _timeTo != null &&
                        _departmentId != null) {
                      BlocProvider.of<DoctorBloc>(context).add(
                        AddDoctorEvent(
                          name: _nameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                          phone: _phoneNumberController.text.trim(),
                          maxToken: int.parse(_maxTokenController.text.trim()),
                          departmentId: _departmentId!,
                          fee: int.parse(_feeController.text.trim()),
                          sex: _gender,
                          dob: _dob!,
                          timeFrom: _timeFrom!,
                          timeTo: _timeTo!,
                        ),
                      );
                      Navigator.pop(context);
                    } else if (_departmentId == null) {
                      showDialog(
                        context: context,
                        builder: (context) => const CustomAlertDialog(
                          title: 'Required!',
                          message:
                              'Department is required, please select the Department',
                          primaryButtonLabel: 'Ok',
                        ),
                      );
                    } else if (_dob == null) {
                      showDialog(
                        context: context,
                        builder: (context) => const CustomAlertDialog(
                          title: 'Required!',
                          message:
                              'Date of Birth is required, please select the Date of Birth',
                          primaryButtonLabel: 'Ok',
                        ),
                      );
                    } else if (_timeFrom == null) {
                      showDialog(
                        context: context,
                        builder: (context) => const CustomAlertDialog(
                          title: 'Required!',
                          message:
                              'Time from is required, please select the Time to',
                          primaryButtonLabel: 'Ok',
                        ),
                      );
                    } else if (_timeTo == null) {
                      showDialog(
                        context: context,
                        builder: (context) => const CustomAlertDialog(
                          title: 'Required!',
                          message:
                              'Time to is required, please select the Time to',
                          primaryButtonLabel: 'Ok',
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
