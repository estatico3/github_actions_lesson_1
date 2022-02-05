import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_course/calculator.dart';

import 'calculator_test.mocks.dart';

@GenerateMocks([Calculator])
void main() {
  late final MockCalculator calculator;

  setUpAll(() {
    calculator = MockCalculator();
  });

  group("add", () {
    test(
      'Should return 7 when add function is called with arguments 3 and 4',
      () {
        when(calculator.add(3, 4)).thenReturn(7);
        final result = calculator.add(3, 4);
        expect(result, 7);
      },
    );
  });

  group("subtract", () {
    test(
      'Should return 3 when subtract function is called with arguments 7 and 4',
      () {
        when(calculator.subtract(7, 4)).thenReturn(3);
        expect(calculator.subtract(7, 4), 3);
      },
    );
    test(
      'Should return 11 when subtract function is called with arguments 7 and -4',
      () {
        when(calculator.subtract(7, -4)).thenReturn(11);
        expect(calculator.subtract(7, -4), 11);
      },
    );
  });

  group('multiply', () {
    test(
        "Should return 0 when multiply function is called with arguments 5 and 0",
        () {
      when(calculator.multiply(5, 0)).thenReturn(0);
      expect(calculator.multiply(5, 0), equals(0));
    });

    test(
        "Should return 8 when multiply function is called with arguments 2 and 4",
        () {
      when(calculator.multiply(2, 4)).thenReturn(8);
      expect(calculator.multiply(2, 4), equals(8));
    });
  });

  group('divide', () {
    test(
        "Should return 0 when divide function is called with arguments 0 and 5",
        () {
      when(calculator.divide(0, 5)).thenReturn(0);
      expect(calculator.divide(0, 5), equals(0));
    });

    test(
        "Should return 5 when divide function is called with arguments 10 and 2",
        () {
      when(calculator.divide(10, 2)).thenReturn(5);
      expect(calculator.divide(10, 2), equals(5));
    });

    test(
        "Should throw an ArgumentError when divide function is called with 0 as a divider",
        () {
      when(calculator.divide(any, 0))
          .thenThrow(ArgumentError("Divider can't be 0"));
      expect(
        () => calculator.divide(10, 0),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.message,
            "message",
            equals("Divider can't be 0"),
          ),
        ),
      );
    });
  });

  group("reminder", () {
    test(
        'Should return future object with value 3 when reminder method is called with arguments 9 and 6',
        () async {
      when(calculator.reminder(9, 6)).thenAnswer((_) => Future.value(3));
      final reminder = await calculator.reminder(9, 6);
      expect(reminder, equals(3));
    });
  });

  group('Fibonacci sequence', () {
    test(
        'Should return a stream with values [0, 1, 1] when fibonacciSequence method is called with argument 3',
        () {
      when(calculator.fibonacciSequence(3))
          .thenAnswer((_) => Stream.fromIterable([0, 1, 1]));
      expect(calculator.fibonacciSequence(3), emitsInOrder([0, 1, 1]));
    });
  });
}
