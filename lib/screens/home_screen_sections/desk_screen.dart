import 'package:flutter/material.dart';
import 'package:medcare_admin/widgets/custom_search.dart';

import '../../widgets/custom_card.dart';
import '../../widgets/desk/add_desk_dialog.dart';
import '../../widgets/desk/desk_card.dart';

class DeskScreen extends StatefulWidget {
  const DeskScreen({super.key});

  @override
  State<DeskScreen> createState() => _DeskScreenState();
}

class _DeskScreenState extends State<DeskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1000,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomSearch(
                        onSearch: (value) {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomCard(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => const AddDeskDialog(),
                        );
                      },
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 15,
                          left: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Add Desk',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 1,
                endIndent: 20,
                indent: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: const [
                      DeskCard(),
                      DeskCard(),
                      DeskCard(),
                      DeskCard(),
                      DeskCard(),
                      DeskCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
