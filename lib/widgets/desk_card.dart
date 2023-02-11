import 'package:flutter/material.dart';

import 'custom_button.dart';

class DeskCard extends StatelessWidget {
  const DeskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      color: const Color(0xFFFFFFFF),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'Name:',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'Gmail:',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'Time:',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    onPressed: () {},
                    label: 'Delete',
                    elevation: 6,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomButton(
                    label: "Edit",
                    elevation: 6,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: SizedBox(
                            width: 600,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Name: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        'Gmail: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Time: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CustomButton(
                                      elevation: 6,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      label: 'Save',
                                      buttonColor: const Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
