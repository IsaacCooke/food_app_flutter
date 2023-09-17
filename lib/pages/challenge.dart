import 'dart:math';

import 'package:flutter/material.dart';

import 'package:food_app_flutter/data/models/challenge.dart';
import 'package:food_app_flutter/data/services/challenge_service.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  ChallengePageState createState() => ChallengePageState();
}

class ChallengePageState extends State<ChallengePage> {
  Widget _challenge = const Center(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text("Challenge loading..."),
          CircularProgressIndicator(),
        ],
      ),
    )
  );

  static const _challengeArray = <String>[
    'Swim at least twice this week.',
    'Go for two long walks this week.',
    'Reduce cheese eating all week.',
    'Avoid sugary foods.',
    'Drink more water.',
    'Walk at least 10km this week.',
    'Spend at least an hour reading this week.',
    'Eat at least 4 vegan meals this week.',
    'Every snack must be healthy this week.',
    'Do at least 10000 steps a day for 4 days this week.',
    'Go to the gym this week.',
    'Have smaller portions for dinner this week.',
    'Have smaller portions for lunch this week.',
    'Do some gardening.',
    'Walk everywhere within a mile this week when going alone.',
    'Spend more time outdoors.',
  ];

  @override
  void initState() {
    super.initState();
    _getChallenge();
  }

  void _getChallenge() async {
    ChallengeService challengeService = ChallengeService();
    final Challenge challenge = await challengeService.getChallenge();
    setState(() => _challenge = Text(challenge.content));
  }

  void _generateNewChallenge() async {
    ChallengeService challengeService = ChallengeService();
    Random random = Random();
    int challengeIndex = random.nextInt(_challengeArray.length);
    await challengeService.insert(Challenge(content: _challengeArray[challengeIndex]));
    _getChallenge();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        ElevatedButton(
            onPressed: () => _generateNewChallenge(),
            child: const Text('Generate new challenge'),
        ),
        _challenge,
      ],
    );
  }
}