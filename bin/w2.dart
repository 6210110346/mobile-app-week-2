const String str = 'on 1 0 set inc inc inc set inc inc inc set set set inc';

void main(List<String> arguments) {
  var commands = str.split(' ');
  for (var command in commands) {
    if (command == 'on') {
      print('yes');
    }
  }
}

class Idle extends State {
  final SettingHour hour;
  final SettingMinute minute;
  Idle(this.hour, this.minute);

  @override
  String toString() {
    return '$hour : $minute';
  }
}

class SettingHour extends State {
  int time;

  SettingHour({this.time = 0});

  void inc() {
    time = (time + 1) % 24;
  }

  @override
  String toString() {
    return time.toString();
  }
}

class SettingMinute extends State {
  int time;

  SettingMinute({this.time = 0});

  void inc() {
    time = (time + 1) % 60;
  }

  @override
  String toString() {
    return time.toString();
  }
}

abstract class State {}
