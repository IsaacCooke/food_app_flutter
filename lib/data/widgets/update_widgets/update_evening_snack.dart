import 'package:flutter/material.dart';

import 'package:food_app_flutter/data/models/day.dart';
import 'package:food_app_flutter/data/services/day_services.dart';

class UpdateEveningSnack extends StatelessWidget {
  const UpdateEveningSnack({
    Key? key,
  }) : super(key: key);

  void _updateEveningSnack(int value) async {
    DayService dayService = DayService();
    final Day currentDay = await dayService.getIdFromDate();
    final int id = currentDay.id!;
    await dayService.updateEveningSnack(value, id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: <Widget>[
          const Text("Update EveningSnack"),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _updateEveningSnack(1);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            child: const Text("1"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _updateEveningSnack(2);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            child: const Text("2"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _updateEveningSnack(3);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            child: const Text("3"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              backgroundColor: Colors.red,
            ),
            child: const Text("Cancel"),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}