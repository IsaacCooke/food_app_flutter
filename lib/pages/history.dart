import 'package:flutter/material.dart';

import 'package:food_app_flutter/data/models/day.dart';
import 'package:food_app_flutter/data/services/day_services.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  DayService _dayService = DayService();
  Widget _totalWidget = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    _loadDays();
  }

  void _loadDays() async {
    final days = await _dayService.getPastSevenDays();
    int total = 0;
    for (Day day in days) {
      total = total + day.breakfast + day.lunch + day.dinner + day.morningSnack + day.afternoonSnack + day.eveningSnack;
    }
    if(total < 77){
      setState(() => _totalWidget = Text('Your score is $total, ${77 - total} under your weekly goal!'));
    } else if(total > 77){
      setState(() => _totalWidget = Text('Your score is $total, ${total - 77} over your weekly goal!'));
    } else {
      setState(() => _totalWidget = Text('Your score is $total, exactly your weekly goal!'));
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Center(
        child: _totalWidget,
      )
    );
  }
}

class DailyBreakdown extends StatefulWidget {
  const DailyBreakdown({Key? key}) : super(key: key);

  @override
  State<DailyBreakdown> createState() => DailyBreakdownState();
}

class DailyBreakdownState extends State<DailyBreakdown> {
  List<Day> _days = [];
  DayService _dayService = DayService();

  @override
  void initState() {
    super.initState();
    _loadDays();
  }

  void _loadDays() async {
    final days = await _dayService.getPastSevenDays();
    setState(() => _days = days);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Breakdown'),
      ),
      body: ListView.builder(
        itemCount: _days.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_days[index].date),
            trailing: Text(_days[index].id.toString()),
          );
        },
      ),
    );
  }
}