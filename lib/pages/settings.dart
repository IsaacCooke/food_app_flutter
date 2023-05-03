import 'package:flutter/material.dart';

import 'package:food_app_flutter/data/services/challenge_service.dart';
import 'package:food_app_flutter/data/services/day_services.dart';
import 'package:food_app_flutter/handlers/notification_handler.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final ChallengeService _challengeService = ChallengeService();
  final DayService _dayService = DayService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _dayService.deleteAll();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    child: const Text('Delete All Days'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _dayService.initDatabase();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    child: const Text('Initialise Day Database'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _challengeService.initDatabase();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    child: const Text('Initialise Challenge Database'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      NotificationHandler().initialiseSettings();
                      NotificationHandler().scheduleNotification();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    child: const Text('Schedule Notifications'),
                  )
                ],
              ))
            ],
          ),
        )
      ),
    );
  }
}