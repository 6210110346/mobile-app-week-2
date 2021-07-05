const String str = 'on 1 0 set inc inc inc set inc inc inc set set set inc';

void main(List<String> arguments) {
  var clock = Clock();
  var commands = str.split(' ');
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
  var states = <State>[Idle(), SettingHour(), SettingMinute()];
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
