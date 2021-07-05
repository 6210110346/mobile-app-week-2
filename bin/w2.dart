const String str = '''on 18 0
set
inc
set
inc
set
inc
inc
set''';

void main(List<String> arguments) {
  var commands = str.split('\n');
  var clock = Clock(0, 0, 0);
  var clockOn = false;
  // for (var i = 0; i < commands.length; i++) {
  //   if (commands[i].contains('on ') && !clockOn) {
  //     var currentState =
  //         (commands[i + 1] == '0' && commands[i + 2] == '0') ? true : false;
  //     clock = Clock(int.parse(commands[i + 1]), int.parse(commands[i + 2]),
  //         currentState ? 1 : 0);
  //     clockOn = true;
  //   }
  // }
  for (var command in commands) {
    if (command.contains('on ')) {
      var items = command.split(' ');
      for(var item in items){
        if(( value = int.tryParse(item)) != null){
          var clockone = Clock(hour, minute, currentState)
        }
      }
    }
    if (clock.currentState != null) {
      if (command == 'set') {
        clock.nextState();
      } else if (command == 'inc') {
        clock.inc();
      }
    }
  }

  print(clock.states);
}

class Clock {
  Clock(int hour, int minute, this.currentState) {
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
    if (states[currentState]?.time == 59) {
      states[1].inc();
    }
    states[currentState].inc();
  }
}

class Idle extends State {
  var time = 0;
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
