class Calculator {
  num add(num a, num b) {
    return a + b;
  }

  num subtract(num a, num b) {
    return a - b;
  }

  num multiply(num a, num b) {
    return a * b;
  }

  num divide(num a, num b) {
    if (b == 0) {
      throw ArgumentError("Divider can't be 0");
    }
    return a / b;
  }

  Future<num> reminder(num a, num b) {
    return Future.value(a % b);
  }

  Stream<int> fibonacciSequence(int sequenceSize) async* {
    if (sequenceSize == 0) return;

    int pauseBetweenEvents = 2;
    if (sequenceSize >= 1) {
      yield 0;
      await Future.delayed(Duration(seconds: pauseBetweenEvents));
    }
    if (sequenceSize >= 2) {
      yield 1;
      await Future.delayed(Duration(seconds: pauseBetweenEvents));
    }
    sequenceSize -= 2;

    int a = 0;
    int b = 1;
    for (int i = 0; i < sequenceSize; i++) {
      var nextNumber = a + b;
      yield nextNumber;

      b = a;
      a = nextNumber;
      await Future.delayed(Duration(seconds: pauseBetweenEvents));
    }
  }
}
