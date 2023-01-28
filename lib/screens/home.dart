import 'package:flutter/material.dart';
import 'package:medcare_admin/screens/dashbord.dart';
import 'package:medcare_admin/screens/doctor_screen.dart';
import 'package:medcare_admin/widgets/dashcard.dart';
import 'package:medcare_admin/widgets/drawer_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 6,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DashboardScreen(),
          DoctorScreen(),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'MENU',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerButton(
                label: 'DASHBOARD',
                onPressed: () {
                  _tabController!.animateTo(0);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 0,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerButton(
                label: 'DOCTORS',
                onPressed: () {
                  _tabController!.animateTo(1);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 1,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerButton(
                label: 'DESK',
                onPressed: () {},
                isSelected: false,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerButton(
                label: 'APPOINTMENTS',
                onPressed: () {},
                isSelected: false,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerButton(
                label: 'LOGOUT',
                onPressed: () {},
                isSelected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
