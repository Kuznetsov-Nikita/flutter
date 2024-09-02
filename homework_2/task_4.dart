import 'dart:isolate';

void main() async {
  Isolate.run(() => infiniteCalculation());
  
  while (true) {
    print(DateTime.now());
    await Future.delayed(Duration(seconds: 1));
  }
}

void infiniteCalculation() {
  DateTime time;
  
  while (true) {
    time = DateTime.now();
  }
}

