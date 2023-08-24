class ReminderModel {
  String? medName;
  String? date;

  ReminderModel({this.medName,  this.date});

  // Add a factory method to convert the map back to the model
  factory ReminderModel.fromJson(Map<String, dynamic> json) {
    return ReminderModel(
      medName: json['med_name'],
      date: json['date'],
    );
  }

  // Add a method to convert the model to a map
  Map<String, dynamic> toJson() {
    return {
      'med_name': medName,
      'date': date,
    };
  }
}