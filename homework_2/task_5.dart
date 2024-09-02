void main() async {
  final timer = TimeService(Duration(seconds: 20));
  
  for (var i = 0; i < 60; ++i) {
    print(timer.currentTime);
    await Future.delayed(Duration(seconds: 1));
    
    if (i == 20) {
      timer.delta = Duration.zero;
    }
    
    if (i == 40) {
      timer.delta = Duration(seconds: 2);
    }
  }
}

class TimeService {
  DateTime? _currentTime;
  Duration _delta;
  
  TimeService(this._delta): assert(_delta > Duration.zero);
  
  Duration get delta => _delta;
  
  set delta(Duration value) {
    if (value > Duration.zero) {
      _delta = value;
    }
  }
  
  String get currentTime {
    final now = DateTime.now();
    if (_currentTime == null || _currentTime!.add(delta).isBefore(now)) {
      _currentTime = now;
    }
    return _currentTime.toString();
  }
}

