class Day {
  int? id;
  final String date;
  final int breakfast;
  final int lunch;
  final int dinner;
  final int morningSnack;
  final int afternoonSnack;
  final int eveningSnack;

  Day({
    this.id,
    required this.date,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.morningSnack,
    required this.afternoonSnack,
    required this.eveningSnack,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'morningSnack': morningSnack,
      'afternoonSnack': afternoonSnack,
      'eveningSnack': eveningSnack,
    };
  }

  factory Day.fromMap(Map<String, dynamic> map) {
    return Day(
      id: map['id'],
      date: map['date'],
      breakfast: map['breakfast'],
      lunch: map['lunch'],
      dinner: map['dinner'],
      morningSnack: map['morningSnack'],
      afternoonSnack: map['afternoonSnack'],
      eveningSnack: map['eveningSnack'],
    );
  }

  Day copy({
    int? id,
    String? date,
    int? breakfast,
    int? lunch,
    int? dinner,
    int? morningSnack,
    int? afternoonSnack,
    int? eveningSnack,
  }) {
    return Day(
      id: id ?? this.id,
      date: date ?? this.date,
      breakfast: breakfast ?? this.breakfast,
      lunch: lunch ?? this.lunch,
      dinner: dinner ?? this.dinner,
      morningSnack: morningSnack ?? this.morningSnack,
      afternoonSnack: afternoonSnack ?? this.afternoonSnack,
      eveningSnack: eveningSnack ?? this.eveningSnack,
    );
  }


  @override
  String toString() {
    return 'Day(date: $date, breakfast: $breakfast, lunch: $lunch, dinner: $dinner, morningSnack: $morningSnack, afternoonSnack: $afternoonSnack, eveningSnack: $eveningSnack)';
  }
}