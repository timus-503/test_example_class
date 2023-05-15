import 'package:flutter_test/flutter_test.dart';
import 'package:test_example/calculator.dart';

void main() {
  group("Testing Calculator", () {
    late Calculator calculator;

    setUpAll(() {
      calculator = Calculator();
    });

    test(
      "Test Add function",
      () {
        final result = calculator.add(10, 20);
        expect(result, 30);
      },
    );

    test(
      "Test Subtract function",
      () {
        final result = calculator.subtract(10, 20);
        expect(result, -10);
      },
    );

    test(
      "Test Divide function",
      () {
        final result = calculator.divide(20, 2);
        expect(result, 10);
      },
    );
  });
}
