import 'package:flutter/material.dart';

import 'package:numberpicker/numberpicker.dart';

import 'package:food_app_flutter/data/models/day.dart';
import 'package:food_app_flutter/data/services/day_services.dart';

class AddDay extends StatefulWidget {
  const AddDay({Key? key}) : super(key: key);

  @override
  State<AddDay> createState() => AddDayState();
}

class AddDayState extends State<AddDay> {
  int _breakfast = 0;
  int _lunch = 0;
  int _dinner = 0;
  int _morningSnack = 0;
  int _afternoonSnack = 0;
  int _eveningSnack = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Day'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flex(
            direction: Axis.vertical,
            children: [
            Expanded(
            child: Column(
              children: <Widget>[
                Text("Breakfast: $_breakfast"),
                NumberPicker(
                    minValue: 0,
                    maxValue: 5,
                    value: _breakfast,
                    onChanged: (value) => setState(() => _breakfast = value),
                  axis: Axis.horizontal,
                ),
                Text("Lunch: $_lunch"),
                NumberPicker(
                    minValue: 0,
                    maxValue: 5,
                    value: _lunch,
                    onChanged: (value) => setState(() => _lunch = value),
                  axis: Axis.horizontal,
                ),
                Text("Dinner: $_dinner"),
                NumberPicker(
                    minValue: 0,
                    maxValue: 5,
                    value: _dinner,
                    onChanged: (value) => setState(() => _dinner = value),
                  axis: Axis.horizontal,
                ),
                Text("Morning Snack: $_morningSnack"),
                NumberPicker(
                    minValue: 0,
                    maxValue: 3,
                    value: _morningSnack,
                    onChanged: (value) => setState(() => _morningSnack = value),
                  axis: Axis.horizontal,
                ),
                Text("Afternoon Snack: $_afternoonSnack"),
                NumberPicker(
                    minValue: 0,
                    maxValue: 3,
                    value: _afternoonSnack,
                    onChanged: (value) => setState(() => _afternoonSnack = value),
                  axis: Axis.horizontal,
                ),
                Text("Evening Snack: $_eveningSnack"),
                NumberPicker(
                    minValue: 0,
                    maxValue: 3,
                    value: _eveningSnack,
                    onChanged: (value) => setState(() => _eveningSnack = value),
                  axis: Axis.horizontal,
                ),
              ElevatedButton(
                  onPressed: () {
                    DayService dayService = DayService();
                    Day _day = Day(
                        date: DateTime(DateTime.now().day, DateTime.now().month, DateTime.now().year),
                        breakfast: _breakfast,
                        lunch: _lunch,
                        dinner: _dinner,
                        morningSnack: _morningSnack,
                        afternoonSnack: _afternoonSnack,
                        eveningSnack: _eveningSnack,
                    );

                    dayService.insert(_day);
                  },
                  child: const Text("Submit"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
              ),
            ],
          ),
          ),
        ]),
        ),
      ),
    );
  }
}