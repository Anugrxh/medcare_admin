import 'package:flutter/material.dart';

import '../custom_action_button.dart';
import '../custom_card.dart';

class DeskCard extends StatelessWidget {
  const DeskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: SizedBox(
        width: 312.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '#432342',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Desk User Name',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: Colors.orange,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 15,
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
              Text(
                'deskuser@medcare.com',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Divider(
                height: 15,
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
              Text(
                '9876543210',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Divider(
                height: 15,
                color: Color.fromARGB(66, 176, 176, 176),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Active',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  CustomActionButton(
                    iconData: Icons.block,
                    color: Colors.red,
                    label: 'Block',
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
