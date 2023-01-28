import 'package:flutter/material.dart';
import 'package:medcare_admin/widgets/dashcard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1000,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: TextFormField(
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  border: InputBorder.none,
                  labelText: 'Search',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                DashCard(),
                SizedBox(
                  width: 80,
                ),
                DashCard(),
                SizedBox(
                  width: 80,
                ),
                DashCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
