class MediumException {
  MediumException(Object type, String msg);
}

class AppString {
  static const invalidJSON = 'askdja';
}

class DateFormat {
  DateFormat(String name);

  DateTime parse(String date) {
    return DateTime.now();
  }
}

class ExampleEntity {
  int id;
  String name;
  DateTime date;

  ExampleEntity({
    required this.id,
    required this.name,
    required this.date,
  });
}

class ExampleModel extends ExampleEntity {
  ExampleModel({
    required super.id,
    required super.name,
    required super.date,
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'id': final num id,
          'name': final String name,
          'date': final String date,
        }) {
      return ExampleModel(
        id: id.toInt(),
        name: name,
        date: DateFormat('dd.MM.yyyy').parse(date),
      );
    } else {
      throw MediumException(ExampleModel, AppString.invalidJSON);
    }
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'date': date,
      };
}
