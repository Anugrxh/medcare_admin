import 'package:flutter/material.dart';

class DashCard extends StatelessWidget {
  const DashCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Total Patients\n       55",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 90, vertical: 40)),
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      elevation: 6,
    );
  }
}
