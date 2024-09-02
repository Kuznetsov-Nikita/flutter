import 'package:flutter_test/flutter_test.dart';
import 'package:homework_11/utils/debouncer.dart';

void main() {
  group('Debouncer', () {
    const delay = Duration(milliseconds: 500);

    late Debouncer debouncer;
    late int callbackCount;

    setUp(() {
      debouncer = Debouncer(delay: delay);
      callbackCount = 0;
    });

    test('Should execute callback after delay', () {
      debouncer.debounce(() {
        callbackCount++;
      });

      expect(callbackCount, 0);

      Future.delayed(delay, () {
        expect(callbackCount, 1);
      });
    });

    test('Should cancel timer', () {
      debouncer.debounce(() {
        callbackCount++;
      });

      debouncer.cancel();

      Future.delayed(delay, () {
        expect(callbackCount, 0);
      });
    });

    test('Should flush callback immediately', () {
      debouncer.debounce(() {
        callbackCount++;
      });

      debouncer.flush();

      expect(callbackCount, 1);
    });
  });
}
