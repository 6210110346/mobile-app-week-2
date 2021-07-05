const String str = 'on 1 0 set inc inc inc set inc inc inc set set set inc';

void main(List<String> arguments) {
  var commands = str.split(' ');
  Clock clock;
  for (var i = 0; i < commands.length; i++) {
    if (commands[i] == 'on') {
      clock = Clock(int.parse(commands[i + 1]), int.parse(commands[i + 2]));
    }
  }
  for (var command in commands) {
    if (clock.currentState != null) {
      if (command == 'set') {
        clock.nextState();
      } else if (command == 'inc') {
        clock.inc();
      }
    }
  }
}

class Clock {
  Clock(int hour, int minute) {
    states = <State>[
      Idle(),
      SettingHour(time: hour),
      SettingMinute(time: minute)
    ];
  }
  var states;
  int currentState;
  void nextState() {
    currentState = (currentState + 1) % 3;
  }

  void inc() {
    states[currentState].inc();
  }
}

class Idle extends State {
  @override
  void inc() {}
}

class SettingHour extends State {
  int time;

  SettingHour({this.time = 0});

  @override
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

  @override
  void inc() {
    time = (time + 1) % 60;
  }

  @override
  String toString() {
    return time.toString();
  }
}

abstract class State {
  void inc();
}
